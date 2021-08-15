<template>
    <div
        v-if="isLogin === true"
        class="h-16 text-center flex flex-row justify-center"
    >
        <span
            class="
                flex flex-col
                justify-center
                w-1/6
                mr-1
                h-16
                text-2xl
                bg-red-500
                hover:bg-red-700
                active:bg-yellow-700
                text-white
                cursor-pointer
            "
            @click="goToReservationForm"
            >予約入力</span
        >
        <span
            class="
                flex flex-col
                justify-center
                w-1/6
                mr-1
                h-16
                text-2xl
                bg-red-500
                hover:bg-red-700
                active:bg-yellow-700
                text-white
                cursor-pointer
            "
            @click="goToReservationList"
            >予約一覧</span
        >
        <span
            class="
                flex flex-col
                justify-center
                w-1/6
                mr-1
                h-16
                text-2xl
                bg-red-500
                hover:bg-red-700
                active:bg-yellow-700
                text-white
                cursor-pointer
            "
            @click="goToReservationViewHistory"
            >閲覧履歴</span
        >
        <span
            class="
                flex flex-col
                justify-center
                w-1/6
                mr-1
                h-16
                text-2xl
                bg-red-500
                hover:bg-red-700
                active:bg-yellow-700
                text-white
                cursor-pointer
            "
            @click="goToReservationHistory"
            >予約履歴</span
        >
        <span
            class="
                flex flex-col
                justify-center
                w-1/6
                mr-1
                h-16
                text-2xl
                bg-red-500
                hover:bg-red-700
                active:bg-yellow-700
                text-white
                font-bold
                cursor-pointer
            "
            @click="goToAccountSettings"
            >アカウント設定</span
        >
    </div>
</template>

<script>
import Router from "../../router/router";

export default {
    data: function () {
        return {};
    },
    computed: {
        isLogin() {
            // TODO ログイン状態を真偽値で返す
            return this.$store.getters.auth.isLogin;
        },
    },
    methods: {
        goToReservationForm() {
            Router.push("/api/v1/user/reservation_form");
        },
        goToReservationList() {
            Router.push("/api/v1/user/reservation_list");
        },
        goToReservationViewHistory() {
            Router.push("/api/v1/user/reservation_view_history");
        },
        goToReservationHistory() {
            Router.push("/api/v1/user/reservation_history");
        },
        goToAccountSettings() {
            Router.push("/api/v1/user/account_info");
        },
    },
};
</script>
