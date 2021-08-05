<template>
    <div class="main m-0">
        <div class="timetable">
            <Timetable />
        </div>
        <div id="fa_container" />
        <dir class="header m-0 text-center pl-0">
            <Header />
        </dir>
        <main>
            <dir class="navigation hidden md:block m-0 p-0">
                <Navigation />
            </dir>
            <ReservationInputs
                title="ご希望のご予約内容"
                subTitle="予約登録入力"
                v-bind:isShowGuideNavi="true"
                v-bind:isShowPersonalInformationProtectionForm="true"
                confirmButtonTitle="送信確認"
                v-bind:confirmButtonCallback="goToConfirm"
            />
            <dir class="footer m-0 pl-0">
                <Footer />
            </dir>
        </main>
    </div>
</template>

<script>
import Router from "../router/router";
import Header from "./layout/Header.vue";
import Navigation from "./layout/Navigation.vue";
import Footer from "./layout/Footer.vue";
import Timetable from "./dialog/Timetable.vue";
import ReservationInputs from "./layout/ReservationInputs.vue";

export default {
    data: function () {
        return {};
    },

    components: {
        Header,
        Navigation,
        ReservationInputs,
        Footer,
        Timetable,
    },

    methods: {
        goToConfirm() {
            Router.push("/api/v1/user/reservation_confirm");
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
