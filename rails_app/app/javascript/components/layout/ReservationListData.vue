<template>
  <div class="container">
    <div class="row row-cols-1 row-cols-md-2 p-4 g-4">
      <div
        v-for="(
          item, arryIndex
        ) in userReservationData.reservationDataArray.filter((d) =>
          isShowItem(d.date_at)
        )"
        :key="arryIndex"
      >
        <div class="col">
          <div
            class="card"
            :class="
              isReserveList() ? 'border-color-cyan' : 'border-color-indigo'
            "
          >
            <div class="card-body">
              <h5 class="card-title">
                <span
                  class="badge border mr-2"
                  :class="
                    isReserveList()
                      ? 'badge-outline-cyan'
                      : 'badge-outline-indigo'
                  "
                  >店舗名</span
                >
                {{ item.store.name }}
              </h5>
              <p class="card-text mt-4">
                <span
                  class="badge border mr-2"
                  :class="
                    isReserveList()
                      ? 'badge-outline-cyan'
                      : 'badge-outline-indigo'
                  "
                  >予約日時</span
                >
                {{ getDateString(item.date_at) }}
              </p>
              <p class="card-text">
                <span
                  class="badge border mr-2"
                  :class="
                    isReserveList()
                      ? 'badge-outline-cyan'
                      : 'badge-outline-indigo'
                  "
                  >予約人数</span
                >
                {{ item.number_people + " 名様" }}
              </p>
              <div class="space-x-2 text-right">
                <button
                  href="#"
                  class="btn text-white"
                  :class="isReserveList() ? 'bg-rt-cyan' : 'bg-rt-indigo'"
                  @click.prevent="goToDetail(arryIndex)"
                >
                  詳　細
                </button>
                <button
                  v-show="isReserveList()"
                  href="#"
                  class="btn text-white btn-outline-cyan"
                  @click.prevent="goToEdit"
                >
                  変　更
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
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
    isReserveList() {
      return this.type === this.reservListType.reservList
    },
    getDateString(date_at) {
      if (date_at) {
        const matches = date_at.match(
          /^([0-9]{4})-([01][0-9])-([0-3][0-9])T([0-2][0-9]):([0-5][0-9])/
        )
        const year = matches[1]
        const month = matches[2]
        const day = matches[3]
        const hours = matches[4]
        const minutes = matches[5]
        return (
          year +
          "年" +
          month +
          "月" +
          day +
          "日 " +
          hours +
          ":" +
          minutes +
          " 〜"
        )
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

<style scoped src="../../../assets/stylesheets/bootstrap.min.css"></style>
<style scoped src="../../../assets/stylesheets/customize.css"></style>
