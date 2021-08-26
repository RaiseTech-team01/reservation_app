<template>
  <div class="main m-0">
    <dir class="header m-0 text-center pl-0">
      <Header />
    </dir>
    <main>
      <dir class="navigation hidden md:block m-0 p-0">
        <Navigation :currentIndex="2" />
      </dir>
      <div class="flex justify-center">
        <div class="bg-gray-300 info-container">
          <BreadClumbList :bcList="breadClumbList" />
          <div class="mt-16 flex flex-col mx-16 mb-16">
            <ReservationListData :type="reservListType.historyList" />
          </div>
        </div>
      </div>
    </main>
    <dir class="footer m-0 pl-0">
      <Footer />
    </dir>
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

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
