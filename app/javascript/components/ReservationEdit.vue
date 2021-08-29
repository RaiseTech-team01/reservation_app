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
        ref="reservationInputs"
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

  methods: {
    updateDate(date) {
      if (date !== null) {
        this.$refs.reservationInputs.setTime(date.getHours(), date.getMinutes())
      }
    },
    showTimetable(e) {
      this.$refs.calendarDialog.showTimetable(e)
    },
    update() {
      // TODO データの更新処理

      Router.back()
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
