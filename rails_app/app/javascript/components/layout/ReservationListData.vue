<template>
  <div>
    <div
      v-for="(
        item, arryIndex
      ) in userReservationData.reservationDataArray.filter((d) =>
        isShowItem(d.date_at)
      )"
      :key="arryIndex"
    >
      <table
        class="
          text-2xl
          font-bold
          text-blue-800
          border-t-2 border-blue-800
          mx-4
          md:table
          block
        "
      >
        <tr class="md:table-row block">
          <td class="pl-2 md:p-2 md:table-cell block">店舗：</td>
          <td class="pl-2 md:p-2 md:table-cell block">
            {{ item.store.name }}
          </td>
          <td class="p-2 md:table-cell hidden">
            <input
              class="
                inline-block
                w-20
                py-1
                rounded-xl
                font-bold
                bg-yellow-300
                md:text-xl
                text-lg text-blue-800
                cursor-pointer
                hover:bg-yellow-200 hover:text-blue-600
                active:bg-red-200
              "
              type="button"
              value="詳細"
              @click.prevent="goToDetail(arryIndex)"
            />
          </td>
        </tr>
        <tr class="md:table-row block mt-4">
          <td class="pl-2 md:p-2 md:table-cell block">予約日時：</td>
          <td class="pl-2 md:p-2 md:table-cell block">{{ item.date_at }}～</td>
          <td class="p-2 md:table-cell hidden">
            <input
              class="
                inline-block
                w-20
                py-1
                rounded-xl
                font-bold
                bg-yellow-300
                md:text-xl
                text-lg text-blue-800
                cursor-pointer
                hover:bg-yellow-200 hover:text-blue-600
                active:bg-red-200
              "
              type="button"
              value="変更"
              @click.prevent="goToEdit"
            />
          </td>
        </tr>
        <tr class="md:table-row block mt-4">
          <td class="pl-2 md:p-2 md:table-cell block" />
          <td class="pl-2 md:p-2 md:table-cell block">
            人数：{{ item.number_people }}名<br
              class="md:hidden"
            />コース予約：{{ item.menu }}
          </td>
        </tr>
      </table>
    </div>
  </div>
</template>

<script>
import Router from "../../router/router"
import { mapGetters } from "vuex"
import axios from "axios"

export const reservListType = {
  reservList: "reservList",
  historyList: "historyList",
}

export default {
  data: function () {
    return {
      arryIndex: "",
      reservListType,
    }
  },
  props: {
    type: String,
  },

  computed: {
    ...mapGetters(["userData"]),
    ...mapGetters(["userReservationData"]),
  },

  mounted() {
    var key_headers = {
      headers: {
        Accept: "application/json",
        "access-token": localStorage.getItem("access-token"),
        uid: localStorage.getItem("uid"),
        client: localStorage.getItem("client"),
      },
    }
    this.requestReservationList(key_headers)
  },
  methods: {
    requestReservationList(key_headers) {
      axios
        .get(
          //  atode
          //  API変更にてコメントアウト
          // `http://localhost:3000/api/v1/user/${this.userData.id}/reservations/`,key_headers)
          `http://localhost:3000/api/v1/user/reservations/`,
          key_headers
        )
        .then((response) => {
          console.log(response.data)
          console.log(response.data[0])
          console.log(response.data[0].user)
          this.$store.dispatch("userReservationData/update", response.data)
          this.$store.dispatch("userReservationData/updateErr", "")
        })

        .catch((error) => {
          // TODO: 適切な Error 表示
          console.log(error.response)
          console.log(error.response.data.error)
          this.$store.dispatch(
            "userReservationData/updateErr",
            error.response.data.error
          )
        })
        .finally(() => {
          console.log("axios finished")
        })
    },
    isShowItem(date_at) {
      switch (this.type) {
        case this.reservListType.reservList:
          return !this.isDateExpired(date_at)
        case this.reservListType.historyList:
          return this.isDateExpired(date_at)
      }
    },
    // 予約データが期限切れか否かを判定
    isDateExpired(date_at, date_on) {
      // TODO サーバから date_at: 日付、date_on: 時間 で返される対応がされたら修正する
      // TODO 現状は date_at : "2021-08-26T19:15:00.000+09:00" を過ぎたら期限切れと判定する
      const expiredDateLong = Date.parse(date_at)
      const nowDateLong = Date.now()
      return nowDateLong > expiredDateLong
    },
    goToDetail(arryIndex) {
      console.log(`${arryIndex}`)
      // this.selected_rdId = counter
      console.log("indexNo:" + arryIndex)
      // Vuex store
      this.$store.dispatch("userReservationDetail/update", arryIndex)
      Router.push({
        name: "ReservationDetail",
        params: { isFromHistory: false },
      })
    },
    goToEdit() {
      Router.push({
        name: "ReservationEdit",
        params: { isFromHistory: false },
      })
    },
  },
}
</script>
