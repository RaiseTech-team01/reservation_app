<template>
    <div @click.prevent="dismiss_timetable">
        <button @click.prevent.stop="show_timetable">ボタン2</button>
        <button @click.prevent.stop="show_timetable">ボタン2</button>
        <button @click.prevent.stop="show_timetable">ボタン2</button>
        <button @click.prevent.stop="show_timetable">ボタン2</button>
        <button @click.prevent.stop="show_timetable">ボタン2</button>
        <button @click.prevent.stop="nextDayX">next</button>
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
                // events: [
                //     {
                //         title: "event 1",
                //         date: "2021-08-02",
                //         start: "2021-08-02 16:30",
                //         end: "2021-08-02 18:30",
                //     },
                //     {
                //         title: "event 2",
                //         date: "2021-08-02",
                //         start: "2021-08-02 20:00",
                //         end: "2021-08-02 22:00",
                //     },
                //     {
                //         title: "event 3",
                //         date: "2021-08-02",
                //         start: "2021-08-02 20:00",
                //         end: "2021-08-02 22:00",
                //     },
                // ],
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
    methods: {
        eventAfterAllRenderX() {
            console.log("eventAfterAllRender");
        },
        successX() {
            console.log("success");
        },
        eventAfterRenderX() {
            console.log("eventAfterRender");
        },
        loadingX(isLoading) {
            console.log("loadingX", isLoading);
        },
        nextDayX() {
            // this.$refs.fullCalendar.getApi();
            console.log("api", this.$refs.fullCalendar.getApi());
            console.log("api2", this.$refs.fullCalendar.getApi().__proto__);
            console.log(
                "api3",
                this.$refs.fullCalendar.getApi().__proto__.__proto__
            );
            // console.log(
            //     "api4",
            //     this.$refs.fullCalendar
            //         .getApi()
            //         .__proto__.__proto__.getCurrentData()
            // );
            this.$refs.fullCalendar.getApi().next();
        },
        // getInitialDate() {
        //     const dt = new Date().now();
        //     console.log("now", dt);
        //     dt.setDate(dt.getDate() + 1);
        //     return dt;
        // },
        destroyX() {
            console.log("destroyX");
        },
        renderX() {
            console.log("render this", this);
            // console.log("fc", FullCalendar);
            // this.changeView("dayGridMonth");
            // this.$refs.fullCalendar.getApi().changeView("timeGridDay");
            // FullCalendar.getApi().changeView("dayGridMonth");
            // this.$refs.fullCalendar.next();
            this.$refs.fullCalendar.getApi().next();
        },
        batchRenderingX() {
            console.log("batch");
            this.changeView("dayGridMonth");
            this.addEvent({ title: "new event", start: "2018-09-01" });
        },
        dummy() {},
        handleDateClick: function (arg) {
            console.log("this", this);
            console.log(arg);
            alert("date click! " + arg.dateStr);
        },
        handleEventClick: function (arg) {
            alert("event click! " + arg.dateStr);
        },
        dismiss_timetable() {
            if ($("#timetable-dialog").is(":visible")) {
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
        show_timetable(event) {
            if (!$("#timetable-dialog").is(":visible")) {
                this.isShowCalendar = true;
                event.target.blur();
                $("#timetable-bg").show();
                $("#timetable-dialog").show("normal", function () {
                    $("body, html").css({ overflow: "hidden", height: "100%" });
                });
                // TODO 初期表示時にカレンダーの表示が不十分な問題に対処（暫定対応としてnext()で表示が正常になる点を利用）
                setTimeout(() => {
                    console.log("setTimeout");
                    this.$refs.fullCalendar.getApi().next();
                }, 500);
            }
        },
    },
};
</script>
