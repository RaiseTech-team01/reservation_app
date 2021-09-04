<template>
  <div class="main m-0">
    <FullCalendarDialog
      ref="calendarDialog"
      v-bind:handleUpdateDate="updateDate"
    />
    <div id="fa_container" />
    <dir class="header m-0 text-center pl-0">
      <Header />
    </dir>
    <main>
      <dir class="navigation hidden md:block m-0 p-0">
        <Navigation :currentIndex="navIndex" />
      </dir>
      <ReservationInputs
        ref="reservationInputsEdit"
        title="ご予約内容の変更"
        subTitle="予約内容変更"
        v-bind:isShowGuideNavi="false"
        v-bind:isShowPersonalInformationProtectionForm="false"
        confirmButtonTitle="更新"
        v-bind:confirmButtonCallback="update"
        cancelButtonTitle="キャンセル"
        v-bind:cancelButtonCallback="cancel"
        v-bind:showTimetableCallback="showTimetable"
      />
      <dir class="footer m-0 pl-0">
        <Footer />
      </dir>
    </main>
  </div>
</template>

<script>
import Router from "../router/router"
import Header from "./layout/Header.vue"
import Navigation from "./layout/Navigation.vue"
import Footer from "./layout/Footer.vue"
import ReservationInputs from "./layout/ReservationInputs.vue"
import { mapGetters } from "vuex"

import "@fullcalendar/core/vdom" // solves problem with Vite
import dayGridPlugin from "@fullcalendar/daygrid"
import interactionPlugin from "@fullcalendar/interaction"
import timeGridPlugin from "@fullcalendar/timegrid"

import FullCalendarDialog from "./dialog/FullCalendarDialog.vue"
import axios from "axios";

export default {
  data: function () {
    return {
      calendarOptions: {
        plugins: [dayGridPlugin, interactionPlugin, timeGridPlugin],
        initialView: "timeGridDay",
        slotDuration: "00:15",
        slotMinTime: "16:00",
        slotMaxTime: "24:00",
      },
      navIndex: -1,
    }
  },
  props: {
    isFromHistory: Boolean,
  },
  components: {
    Header,
    Navigation,
    ReservationInputs,
    Footer,
    FullCalendarDialog,
  },
  computed: {
    ...mapGetters(["userReservationData"]),
    ...mapGetters(["userReservationDetail"]),
  },
  mounted() {
    const initalValue =  this.userReservationData.reservationDataArray[
        this.userReservationDetail.rdId
        ]

    // JavaScriptの日にちオブジェクトをつくる。月が０から始まる
    //例２）年月日を指定して生成する(2016/3/29)
    // var dt = new Date(2016, 2, 29);
    // "2020-12-31T15:00:00.000+09:00"
    // initalValue.date_at.slice(0,4)
    // initalValue.slice(5,7)
    // initalValue.slice(8,10)

    // reservationInputData.= initalValue.store.name

    var dt = new Date(
        initalValue.date_at.slice(0,4), // yy
        Number(initalValue.date_at.slice(5,7))+1,  // mm
        initalValue.date_at.slice(8,10), // dd
        initalValue.date_at.slice(11,12), // hh
        initalValue.date_at.slice(14,16), // mm
    );

    this.$refs.reservationInputsEdit.reservationInputData.store_name = initalValue.store.name

    this.$refs.reservationInputsEdit.reservationInputData.date = dt
    this.$refs.reservationInputsEdit.setTime(dt.getHours(), dt.getMinutes());
    this.$refs.reservationInputsEdit.reservationInputData.number_people = initalValue.number_people
    this.$refs.reservationInputsEdit.reservationInputData.budget = initalValue.budget
    console.log(dt)
    console.log(initalValue.budget)

  },

  methods: {
    convertTwoDigit(value) {
      return ("0" + value).slice(-2)
    },
    updateDate(date) {
      if (date !== null) {
        this.$refs.reservationInputsEdit.setTime(date.getHours(), date.getMinutes())
      }
    },
    showTimetable(e) {
      this.$refs.calendarDialog.showTimetable(e)
    },
    update(reservationInputs) {
      // TODO データの更新処理
      var editReservationParams = [] // 配列を新しく定義する
      editReservationParams.date_on =
          // 日にち
          reservationInputs.date.getFullYear() +
          "-" +
          // JavaScriptの日にちオブジェクトをつくる。月が０から始まる
          //例２）年月日を指定して生成する(2016/3/29)
          // var dt = new Date(2016, 2, 29);
          this.convertTwoDigit(reservationInputs.date.getMonth() + 1) +
          "-" +
          this.convertTwoDigit(reservationInputs.date.getDate()) +
          " " +
          // 時間
          reservationInputs.hour +
          ":" +
          reservationInputs.minute
      editReservationParams.date_at = editReservationParams.date_on
      editReservationParams.number_people =
          reservationInputs.number_people
      editReservationParams.menu = reservationInputs.menu
      editReservationParams.budget = reservationInputs.budget
      editReservationParams.inquiry = reservationInputs.inquiry


      editReservationParams.id =  this.userReservationData.reservationDataArray[
          this.userReservationDetail.rdId
          ].id
      // editReservationParams.user_id = this.userData.id
      // store_idがわからないので、１を指定しておく
      // atokara 後から編集
      // editReservationParams.store_id = 1
      // 以下の書式でいらないデータを削除
      // delete editReservationParams.errs
      // delete editReservationParams.date;
      // delete editReservationParams.hour;
      // delete editReservationParams.minute;
      console.log(editReservationParams)
      // 配列をaxiosで送れるオブジェクトへ変換
      var convertAddReservationParams = Object.assign({}, editReservationParams)
      console.log(convertAddReservationParams)

      var key_headers = {
        headers: {
          Accept: "application/json",
          "access-token": localStorage.getItem("access-token"),
          uid: localStorage.getItem("uid"),
          client: localStorage.getItem("client"),
        }
      }

      const storeId = this.userReservationData.reservationDataArray[
          this.userReservationDetail.rdId
          ].store.id
      axios
          .put(
              `/api/v1/user/reservations/${storeId}`,
              convertAddReservationParams,
              key_headers
          )
          .then(function (response) {
            console.log(response)
            Router.push({
              name: "ReservationList",
              params: { isFirstDraw: false },
            })
          })
          .catch((error) => {

          })
    },
    cancel() {
      Router.back()
    },
  },
  created() {
    this.navIndex = this.$route.params.isFromHistory ? 2 : 1
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
.radiox {
  transform: scale(2, 2);
}
</style>


///

http -v PUT  http://localhost:3000/api/v1/user/reservations/2 \　/#最後の数字は、ストアーのID 送信時はけすこと
uid:user1@sample.com access-token:letcBr7nca4Tw5UXQsxnkw client:7GyPMiEKHOpJktgbisGkvg \
id=4 \ /#予約のID 送信時はけすこと
date_at=2021-5-5 15:00:00 \
date_on=2021-5-5 15:00:00 \
number_people=55 \
menu=55mikan \
budget=55555 \
inquiry=MyText

///

;;;;;;;;;;;;;;;;;;;;;;;;;



http -v POST http://localhost:3000/api/v1/user/reservations \
uid:user1@sample.com access-token:23Wt8AWEezA_EOd9XpnzVA client:P9PFqA5G91K3R4dJFmr4pg \
date_at=2021-10-05 03:00 \
date_on=2021-10-05 03:00 \
number_people=234 \
menu=mikan \
budget=4000 \
inquiry=MyText \
user_id=1 \
store_id=3
