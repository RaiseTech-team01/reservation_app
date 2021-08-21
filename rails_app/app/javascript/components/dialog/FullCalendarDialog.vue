<template>
  <div @click.prevent="dismissTimetable">
    <div
      id="timetable-bg"
      class="hidden absolute w-full h-full z-10 bg-black opacity-50"
    />
    <div @click.prevent.stop="">
      <FullCalendar
        id="timetable-dialog"
        class="
          hidden
          absolute
          w-1/2
          h-5/6
          transform
          translate-x-1/2 translate-y-5
          z-10
          border-2 border-black
          text-center
          p-8
          bg-white
        "
        :options="calendarOptions"
        ref="fullCalendar"
        v-show="isShowCalendar"
      />
    </div>
  </div>
</template>

<script>
import "@fullcalendar/core/vdom"; // solves problem with Vite
import FullCalendar from "@fullcalendar/vue";
import interactionPlugin from "@fullcalendar/interaction";
import dayGridPlugin from "@fullcalendar/daygrid";
import timeGridPlugin from "@fullcalendar/timegrid";

export default {
  data: function () {
    return {
      isShowCalendar: false,
      calendarOptions: {
        plugins: [interactionPlugin, dayGridPlugin, timeGridPlugin],
        initialView: "timeGridDay",
        defaultView: "timeGridDay",
        // TODO 初期表示時にカレンダーの表示が不十分な問題に対処（暫定対応としてnext()で表示が正常になる点を利用。ここで前日に設定）
        initialDate: new Date().setDate(new Date().getDate() - 1),
        render: this.renderX,
        destroy: this.destroyX,
        dateClick: this.handleDateClick,
        eventClick: this.handleEventClick,
        loading: this.loadingX,
        ref: "fullCalendar",
        slotDuration: "00:15",
        slotMinTime: "16:00",
        slotMaxTime: "24:00",
        hiddenDays: [], // range:0-6, Sunday is 0
        dayHeaders: false,
        eventAfterRender: this.eventAfterRenderX,
        success: this.successX,
        eventAfterAllRender: this.eventAfterAllRenderX,
      },
    };
  },
  components: {
    FullCalendar,
  },
  props: {
    handleUpdateDate: Function,
  },
  methods: {
    handleDateClick: function (arg) {
      console.log("check", "inside handleDateClick");
      const date = new Date(arg.dateStr);
      if (date !== null) {
        console.log("check", "inside if 2");
        this.handleUpdateDate(date);
      }
      this.dismissTimetable();
    },
    handleEventClick: function (arg) {
      console.log("check", "inside handleEventClick");
      alert("event click! " + arg.dateStr);
    },
    dismissTimetable() {
      console.log("check", "inside dismissTimetable");
      if ($("#timetable-dialog").is(":visible")) {
        console.log("check", "inside if 9");
        this.isShowCalendar = false;
        $("#timetable-bg").hide();
        $("#timetable-dialog").hide("normal", function () {
          $("body, html").css({
            overflow: "visible",
            height: "auto",
          });
        });
      }
    },
    showTimetable(event) {
      console.log("check", "inside showTimetable");
      if (!$("#timetable-dialog").is(":visible")) {
        console.log("check", "inside if 1");
        this.isShowCalendar = true;
        event.target.blur();
        $("#timetable-bg").show();
        $("#timetable-dialog").show("normal", function () {
          $("body, html").css({ overflow: "hidden", height: "100%" });
        });
        // TODO 初期表示時にカレンダーの表示が不十分な問題に対処（暫定対応としてnext()で表示が正常になる点を利用）
        setTimeout(() => {
          this.$refs.fullCalendar.getApi().next();
        }, 500);
      }
    },
  },
};
</script>
