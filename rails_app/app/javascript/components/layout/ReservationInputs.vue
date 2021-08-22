<template>
    <div class="flex justify-center">
        <div class="bg-gray-300 info-container">
            <BreadClumbList :bcList="breadClumbList" />
            <div class="mt-16" v-show="isShowGuideNavi">
                <div>
                    <p
                        class="
                            whitespace-nowrap
                            flex
                            justify-around
                            md:justify-center
                            md:space-x-12
                            md:transform
                            md:scale-125
                            md:flex-none
                        "
                    >
                        <span class="arrow-block">入力</span>
                        <span class="arrow-block-inactive">確認</span>
                        <span class="arrow-block-inactive">登録</span>
                    </p>
                </div>
            </div>
            <div>
                <h2
                    class="
                        mt-16
                        mb-8
                        font-bold
                        text-3xl
                        md:text-4xl
                        text-center text-blue-800
                    "
                >
                    {{ title }}
                </h2>
                <form>
                    <table class="m-2 md:m-10 table-auto">
                        <tr>
                            <td
                                class="
                                    text-3xl
                                    mg:text-4xl
                                    whitespace-nowrap
                                    form-table-padding
                                    p-4
                                    md:p-6
                                    text-blue-800
                                "
                            >
                                店舗
                            </td>
                            <td class="space-x-4">
                                <div
                                    class="
                                        flex
                                        justify-between
                                        space-x-4
                                        md:flex-none
                                    "
                                >
                                    <input
                                        class="
                                            w-full
                                            md:w-96
                                            h-12
                                            border-2
                                            md:border-4
                                            border-blue-700
                                            bg-gray-100
                                            pl-4
                                            text-3xl
                                        "
                                        name="store_name"
                                        type="text"
                                        placeholder="イロハ駅前店"
                                    />
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td
                                class="
                                    text-3xl
                                    mg:text-4xl
                                    whitespace-nowrap
                                    form-table-padding
                                    p-4
                                    md:p-6
                                    text-blue-800
                                "
                            >
                                日付
                            </td>
                            <td>
                                <div
                                    class="
                                        flex
                                        justify-start
                                        space-x-2
                                        md:flex-none
                                    "
                                >
                                    <v-date-picker
                                        v-model="reservationInputData.date"
                                        mode="date"
                                        :value="null"
                                        color="orange"
                                        :columns="
                                            $screens({
                                                default: 1,
                                                lg: 2,
                                            })
                                        "
                                        :step="1"
                                        :min-date="new Date()"
                                        :max-date="getDateAfterMonths(2)"
                                    >
                                        <template
                                            v-slot="{ inputValue, inputEvents }"
                                        >
                                            <input
                                                class="
                                                    w-72
                                                    h-12
                                                    border-2
                                                    md:border-4
                                                    border-blue-700
                                                    bg-gray-100
                                                    pl-4
                                                    text-blue-800 text-3xl
                                                    cursor-pointer
                                                "
                                                :value="inputValue"
                                                v-on="inputEvents"
                                            />
                                        </template>
                                    </v-date-picker>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td
                                class="
                                    text-2xl
                                    md:text-3xl
                                    whitespace-nowrap
                                    form-table-padding
                                    p-4
                                    md:p-6
                                    text-blue-800
                                "
                            >
                                時間帯
                            </td>
                            <td>
                                <div
                                    class="
                                        flex
                                        justify-start
                                        space-x-2
                                        md:flex-none
                                    "
                                >
                                    <select
                                        v-model="reservationInputData.hour"
                                        id="hours_selector"
                                        class="
                                            w-24
                                            md:w-24
                                            h-12
                                            border-2
                                            md:border-4
                                            border-blue-700
                                            bg-gray-100
                                            pl-4
                                            text-blue-800 text-3xl
                                            cursor-pointer
                                        "
                                        name="hour"
                                        type="text"
                                        required
                                        @click="showTimetableCallback"
                                    />
                                    <span
                                        class="
                                            inline-block
                                            px-2
                                            text-3xl
                                            md:text-4xl
                                            whitespace-nowrap
                                            form-table-padding
                                            text-blue-800
                                        "
                                        >時</span
                                    >
                                    <select
                                        v-model="reservationInputData.minute"
                                        id="minutes_selector"
                                        class="
                                            w-24
                                            md:w-24
                                            h-12
                                            border-2
                                            md:border-4
                                            border-blue-700
                                            bg-gray-100
                                            pl-4
                                            text-blue-800 text-3xl
                                            cursor-pointer
                                        "
                                        name="minute"
                                        type="text"
                                        required
                                        @click="showTimetableCallback"
                                    />
                                    <span
                                        class="
                                            inline-block
                                            px-2
                                            text-3xl
                                            md:text-4xl
                                            whitespace-nowrap
                                            form-table-padding
                                            text-blue-800
                                        "
                                        >分</span
                                    >
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td
                                class="
                                    text-2xl
                                    md:text-3xl
                                    whitespace-nowrap
                                    form-table-padding
                                    p-4
                                    md:p-6
                                    text-blue-800
                                "
                            >
                                ご利用人数
                            </td>
                            <td>
                                <input
                                    class="
                                        w-1/3
                                        md:w-28
                                        h-12
                                        border-2
                                        md:border-4
                                        border-blue-700
                                        bg-gray-100
                                        pl-4
                                        text-3xl text-blue-800
                                    "
                                    name="guests_number"
                                    type="number"
                                    min="1"
                                    step="1"
                                    required
                                    placeholder="2"
                                    v-model="reservationInputData.number_people"
                                />
                                <span
                                    class="
                                        inline-block
                                        px-2
                                        text-3xl
                                        md:text-4xl
                                        whitespace-nowrap
                                        form-table-padding
                                        text-blue-800
                                    "
                                    >名様</span
                                >
                            </td>
                        </tr>
                        <tr>
                            <td
                                class="
                                    text-2xl
                                    md:text-3xl
                                    whitespace-nowrap
                                    form-table-padding
                                    p-4
                                    md:p-6
                                    text-blue-800
                                "
                            >
                                ご予算
                            </td>
                            <td>
                                <input
                                    class="
                                        w-1/2
                                        md:w-40
                                        h-12
                                        border-2
                                        md:border-4
                                        border-blue-700
                                        bg-gray-100
                                        pl-4
                                        text-3xl text-blue-800
                                    "
                                    name="price"
                                    type="number"
                                    min="500"
                                    step="500"
                                    required
                                    placeholder="3000"
                                    v-model="reservationInputData.budget"
                                />
                                <span
                                    class="
                                        text-3xl
                                        md:text-4xl
                                        whitespace-nowrap
                                        form-table-padding
                                        p-4
                                        md:p-6
                                        text-blue-800
                                    "
                                    >円</span
                                >
                            </td>
                        </tr>
                    </table>
                    <div v-show="isShowPersonalInformationProtectionForm">
                        <p
                            class="
                                flex
                                justify-start
                                space-x-8
                                mt-10
                                md:ml-16
                                ml-8
                            "
                        >
                            <label>
                                <input
                                    class="
                                        radiox
                                        inline-block
                                        mr-2
                                        align-middle
                                        transform
                                        scale-150
                                    "
                                    type="checkbox"
                                    name="privacy_policy"
                                    value="yes"
                                    required
                                />
                                <span
                                    class="
                                        mt-4
                                        mb-4
                                        text-2xl
                                        md:text-3xl
                                        font-bold
                                        align-middle
                                        text-blue-800
                                        hover:text-blue-600
                                    "
                                    >個人情報保護方針に同意する</span
                                >
                            </label>
                        </p>
                    </div>
                    <div
                        class="text-center space-x-4 md:space-x-8 mt-14 mb-28"
                        v-show="isShowButton"
                    >
                        <input
                            class="
                                inline-block
                                w-2/5
                                py-2
                                rounded-xl
                                font-bold
                                bg-yellow-300
                                text-4xl text-blue-800
                                cursor-pointer
                                hover:bg-yellow-200 hover:text-blue-600
                                active:bg-red-200
                            "
                            type="button"
                            v-show="isShowButton1"
                            v-bind:value="confirmButtonTitle"
                            @click.prevent="confirmButtonCallback(reservationInputData)"
                        />
                        <input
                            class="
                                inline-block
                                w-2/5
                                py-2
                                rounded-xl
                                font-bold
                                bg-yellow-300
                                text-4xl text-blue-800
                                cursor-pointer
                                hover:bg-yellow-200 hover:text-blue-600
                                active:bg-red-200
                            "
                            type="button"
                            v-show="isShowButton2"
                            v-bind:value="cancelButtonTitle"
                            @click.prevent="cancelButtonCallback"
                        />
                    </div>
                </form>
            </div>
        </div>
    </div>
</template>
<script>
import BreadClumbList from "../commons/layouts/BreadClumbList.vue";

export default {
    data: function () {
        return {
            reservationInputData:{
                date: new Date(),
                hour:"",
                minute:"",
                number_people: "",
                // menu:"",
                budget: "",
                // inquiry:"",
            },
            date: new Date(),
            breadClumbList: [
                {
                    title: "トップ",
                    href: "/home/top",
                },
                {
                    title: this.subTitle,
                },
            ],
        };
    },

    components: {
        BreadClumbList,
    },

    props: {
        title: String,
        subTitle: String,
        isShowGuideNavi: Boolean,
        isShowPersonalInformationProtectionForm: Boolean,
        confirmButtonTitle: String,
        confirmButtonCallback: Function,
        cancelButtonTitle: String,
        cancelButtonCallback: Function,
        showTimetableCallback: Function,
    },
    methods: {
        convertTwoDigit(value) {
            return ("0" + value).slice(-2);
        },
        addOption(select, value) {
            if (select.childNodes.length > 0) {
                select.removeChild(select.firstChild);
            }
            let option = document.createElement("option");
            option.setAttribute("value", value);
            option.innerHTML = value;
            select.appendChild(option);
        },
        setTime(hours, minutes) {
            const hoursSel = document.getElementById("hours_selector");
            this.addOption(hoursSel, this.convertTwoDigit(hours));

            const minutesSel = document.getElementById("minutes_selector");
            this.addOption(minutesSel, this.convertTwoDigit(minutes));

            this.reservationInputData.hour=this.convertTwoDigit(hours)
            this.reservationInputData.minute=this.convertTwoDigit(minutes)
        },
        getDateAfterMonths(month) {
            let date = new Date();
            return date.setMonth(date.getMonth() + month);
        },
    },
    computed: {
        isShowButton() {
            return (
                this.confirmButtonTitle !== undefined ||
                this.cancelButtonTitle !== undefined
            );
        },
        isShowButton1() {
            return this.confirmButtonTitle !== undefined;
        },
        isShowButton2() {
            return this.cancelButtonTitle !== undefined;
        },
    },
};
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
