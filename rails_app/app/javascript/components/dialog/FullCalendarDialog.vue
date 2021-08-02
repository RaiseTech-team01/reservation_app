<template>
    <div @click.prevent="dismiss_timetable">
        <button @click.prevent.stop="show_timetable">ボタン2</button>
        <button @click.prevent.stop="show_timetable">ボタン2</button>
        <button @click.prevent.stop="show_timetable">ボタン2</button>
        <button @click.prevent.stop="show_timetable">ボタン2</button>
        <button @click.prevent.stop="show_timetable">ボタン2</button>
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
                v-show="isShowCalendar"
            />
        </div>
    </div>
</template>

<script>
import "@fullcalendar/core/vdom"; // solves problem with Vite
import FullCalendar from "@fullcalendar/vue";
import interactionPlugin from "@fullcalendar/interaction";
import timeGridPlugin from "@fullcalendar/timegrid";

export default {
    data: function () {
        return {
            isShowCalendar: false,
            calendarOptions: {
                plugins: [interactionPlugin, timeGridPlugin],
                initialView: "timeGridDay",
                dateClick: this.handleDateClick,
                eventClick: this.handleEventClick,
                events: [
                    {
                        title: "event 1",
                        date: "2021-08-02",
                        start: "2021-08-02 16:30",
                        end: "2021-08-02 18:30",
                    },
                    {
                        title: "event 2",
                        date: "2021-08-02",
                        start: "2021-08-02 20:00",
                        end: "2021-08-02 22:00",
                    },
                    {
                        title: "event 3",
                        date: "2021-08-02",
                        start: "2021-08-02 20:00",
                        end: "2021-08-02 22:00",
                    },
                ],
                slotDuration: "00:15",
                slotMinTime: "16:00",
                slotMaxTime: "24:00",
            },
        };
    },
    components: {
        FullCalendar,
    },
    methods: {
        dummy() {},
        handleDateClick: function (arg) {
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
            }
        },
    },
};
</script>
