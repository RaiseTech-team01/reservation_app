<template>
  <div class="main m-0">
    <dir class="header m-0 text-center pl-0">
      <Header :currentIndex="2" />
    </dir>
    <main>
      <div class="mt-5 py-5 text-center">
        <h2>利用履歴</h2>
      </div>
      <ReservationListData :type="reservListType.historyList" />
    </main>
  </div>
</template>

<script>
import Router from "../router/router"
import Header from "./layout/Header.vue"
import Navigation from "./layout/Navigation.vue"
import Footer from "./layout/Footer.vue"
import ReservationListData from "./layout/ReservationListData.vue"
import { reservListType } from "./layout/ReservationListData.vue"
import BreadClumbList from "./commons/layouts/BreadClumbList.vue"

export default {
  data: function () {
    return {
      breadClumbList: [
        {
          title: "トップ",
          href: "/home/top",
        },
        {
          title: "予約履歴",
        },
      ],
      reservListType,
    }
  },

  components: {
    Header,
    Navigation,
    Footer,
    ReservationListData,
    BreadClumbList,
  },

  methods: {
    goToDetail() {
      Router.push({
        name: "ReservationDetail",
        params: { isFromHistory: true },
      })
    },
    goToEdit() {
      Router.push({
        name: "ReservationEdit",
        params: { isFromHistory: true },
      })
    },
  },
}
</script>

<style scoped src="../../assets/stylesheets/bootstrap.min.css"></style>
<style scoped src="../../assets/stylesheets/customize.css"></style>
<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
