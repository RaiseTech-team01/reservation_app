<template>
  <div class="main m-0">
    <div>
      <FullCalendarDialog
        ref="calendarDialog"
        v-bind:handleUpdateDate="updateDate"
      />
    </div>
    <div id="fa_container" />
    <dir class="header m-0 text-center pl-0">
      <Header :currentIndex="0" />
    </dir>
    <main>
      <ReservationInputs
        ref="reservationInputs"
        type="new"
        title="予約登録"
        v-bind:isShowGuideNavi="true"
        v-bind:isShowPersonalInformationProtectionForm="true"
        confirmButtonTitle="送信確認"
        v-bind:confirmButtonCallback="goToConfirm"
        v-bind:showTimetableCallback="showTimetable"
      />
    </main>
  </div>
</template>

<script>
import Router from "../router/router"
import Header from "./layout/Header.vue"
import Navigation from "./layout/Navigation.vue"
import Footer from "./layout/Footer.vue"
import Timetable from "./dialog/Timetable.vue"
import ReservationInputs from "./layout/ReservationInputs.vue"

import "@fullcalendar/core/vdom" // solves problem with Vite
import dayGridPlugin from "@fullcalendar/daygrid"
import interactionPlugin from "@fullcalendar/interaction"
import timeGridPlugin from "@fullcalendar/timegrid"
import FullCalendarDialog from "./dialog/FullCalendarDialog.vue"

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
    }
  },

  components: {
    Header,
    Navigation,
    ReservationInputs,
    Footer,
    FullCalendarDialog,
  },

  methods: {
    updateDate(date) {
      if (date !== null) {
        this.$refs.reservationInputs.setTime(date.getHours(), date.getMinutes())
      }
    },
    goToConfirm(reservationInputData) {
      this.$store.dispatch(
        "userReservationFormData/update",
        reservationInputData
      )
      Router.push("/reservation_confirm")
    },
    showTimetable(e) {
      this.$refs.calendarDialog.showTimetable(e)
    },
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
