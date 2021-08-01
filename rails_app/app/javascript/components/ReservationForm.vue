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
            <ReservationInputs />
            <dir class="footer m-0 pl-0">
                <Footer />
            </dir>
        </main>
    </div>
</template>

<script>
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

    methods: {},
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
