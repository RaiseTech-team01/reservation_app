<template>
  <div class="main m-0">
    <dir class="header m-0 text-center pl-0">
      <Header />
    </dir>
    <div class="container mt-16">
      <main>
        <div class="mt-5 py-5 text-center">
          <h2>アカウント登録完了</h2>
        </div>
        <div class="row g-5 flex justify-center">
          <div class="col-5">
            <img src="/ojigi.png" class="rounded mx-auto d-block" alt="ojigi" />
            <p class="mt-3 fs-4">ご登録ありがとうございました！</p>
            <p class="fs-4">予約画面にご移動ください。</p>
          </div>
        </div>
        <div class="text-center">
          <button
            type="button"
            class="m-3 px-5 btn btn-lg btn-block text-white bg-rt-cyan"
            @click.prevent="login"
          >
            予約へ移動
          </button>
        </div>
      </main>
    </div>
  </div>
</template>

<script>
import Router from "../router/router"
import Header from "./layout/Header.vue"
import Navigation from "./layout/Navigation.vue"
import Footer from "./layout/Footer.vue"
import BreadClumbList from "./commons/layouts/BreadClumbList.vue"
import axios from "axios"
import { mapGetters } from "vuex"

export default {
  data: function () {
    return {
      registeredEmail: "",
      registeredPassword: "",
      loginedUserData: {
        address: "",
        allow_password_change: "",
        birthday: "",
        email: "",
        furigana: "",
        gender: "",
        id: "",
        image: "",
        name: "",
        provider: "",
        tel: "",
        uid: "",
      },
      breadClumbList: [
        {
          title: "トップ",
          href: "/home/top",
        },
        {
          title: "ログイン",
          href: "/login",
        },
        {
          title: "新規登録完了",
        },
      ],
    }
  },

  components: {
    Header,
    Navigation,
    Footer,
    BreadClumbList,
  },

  methods: {
    login() {
      this.registeredEmail = this.registrationUserData.email
      this.registeredPassword = this.registrationUserData.password
      this.loading = true
      const params = {
        email: `${this.registeredEmail}`,
        password: `${this.registeredPassword}`,
      }
      axios
        .post("/api/v1/auth/sign_in", params)
        .then((response) => {
          localStorage.setItem("access-token", response.headers["access-token"])
          localStorage.setItem("uid", response.headers["uid"])
          localStorage.setItem("client", response.headers["client"])

          // console.log(response.data.data)
          this.loginedUserData = response.data.data
          console.log(this.loginedUserData)

          // Vuex store
          this.$store.dispatch("userData/update", this.loginedUserData)
          this.$store.dispatch("auth/updateLogin", true)
          this.goToReservation()
        })
        .catch((e) => {
          // TODO: 適切な Error 表示
          if (e.response) {
            console.log(e.response.data)
            console.log(e.response.status)
            console.log(e.response.headers)
          } else if (error.request) {
            console.log(e.request)
          } else {
            console.log("Error", e.message)
          }
          this.goToLogin()
        })
        .finally(() => {
          this.loading = false
        })
    },
    goToReservation() {
      Router.push("/reservation_form")
    },
    goToLogin() {
      Router.push("/login")
    },
  },
  computed: {
    ...mapGetters(["registrationUserData"]),
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
