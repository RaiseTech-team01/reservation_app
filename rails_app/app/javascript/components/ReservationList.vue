<template>
  <div class="main m-0">
    <dir class="header m-0 text-center pl-0">
      <Header :currentIndex="1" />
    </dir>
    <main>
      <dir class="navigation hidden md:block m-0 p-0">
        <Navigation :currentIndex="1" />
      </dir>
      <div class="flex justify-center">
        <div class="bg-gray-300 info-container">
          <BreadClumbList :bcList="breadClumbList" />
          <div class="mt-16 flex flex-col mx-16 mb-16">
            <ReservationListData :type="reservListType.reservList" />
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
import { mapGetters } from "vuex"
import axios from "axios"

export default {
  data: function () {
    return {
      arryIndex: "",
      breadClumbList: [
        {
          title: "トップ",
          href: "/home/top",
        },
        {
          title: "予約一覧",
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

  computed: {
    ...mapGetters(["userData"]),
    ...mapGetters(["userReservationData"]),
  },

  mounted() {
    var key_headers = {
      headers: {
        Accept: "application/json",
        "access-token": localStorage.getItem("access-token"),
        uid: localStorage.getItem("uid"),
        client: localStorage.getItem("client"),
      },
    }
    axios
      .get(
        //  atode
        //  API変更にてコメントアウト
        // `http://localhost:3000/api/v1/user/${this.userData.id}/reservations/`,key_headers)
        `http://localhost:3000/api/v1/user/reservations/`,
        key_headers
      )
      .then((response) => {
        console.log(response.data)
        console.log(response.data[0])
        console.log(response.data[0].user)
        // Vuex store
        this.$store.dispatch("userReservationData/update", response.data)
        this.$store.dispatch("userReservationData/updateErr", "")
      })

      .catch((error) => {
        // TODO: 適切な Error 表示
        console.log(error.response)
        console.log(error.response.data.error)
        this.$store.dispatch(
          "userReservationData/updateErr",
          error.response.data.error
        )
      })
      .finally(() => {
        console.log("axios finished")
      })
  },
  methods: {
    goToDetail(arryIndex) {
      console.log(`${arryIndex}`)
      // this.selected_rdId = counter
      console.log("indexNo:" + arryIndex)
      // Vuex store
      this.$store.dispatch("userReservationDetail/update", arryIndex)
      Router.push({
        name: "ReservationDetail",
        params: { isFromHistory: false },
      })
    },
    goToEdit() {
      Router.push({
        name: "ReservationEdit",
        params: { isFromHistory: false },
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
