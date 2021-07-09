<<<<<<< HEAD
<template>
<div class="main m-0 h-screen flex flex-col justify-between">
  <dir class="header m-0 text-center pl-0">
    <Header />
  </dir>
  <main class="flex justify-center h-full">
    <div class="bg-gray-300 info-container">
      <div>
        <h3 class="mt-10 ml-4 text-xl text-blue-800">
          <a class="font-bold hover:text-blue-500" href="/home/top">トップ</a>
          <span> > </span>
          <a class="font-bold hover:text-blue-500" href="/login">ログイン</a>
          <span> > </span>
          <a class="font-bold hover:text-blue-500" href="/sign_up">新規登録完了</a>
        </h3>
      </div>
      <div class="mt-16">
        <div>
          <p class="whitespace-nowrap flex justify-around md:justify-center md:space-x-12 md:transform md:scale-125 md:flex-none">
            <span class="arrow-block-inactive">入力</span>
            <span class="arrow-block-inactive">確認</span>
            <span class="arrow-block">登録</span>
          </p>
        </div>
      </div>
      <div>
        <h2 class="mt-16 mb-8 font-bold text-3xl md:text-4xl text-center text-blue-800">登録を完了いたしました。<br />ありがとうございました。</h2>
        <form>
          <div class="text-center space-x-4 md:space-x-8 mt-14 pb-28">
            <input class="inline-block w-3/5 py-2 rounded-xl font-bold bg-yellow-300 text-4xl text-blue-800 cursor-pointer hover:bg-yellow-200 hover:text-blue-600 active:bg-red-200" type="button" value="ログインする" @click.prevent="login" />
          </div>
        </form>
      </div>
    </div>
  </main>
  <dir class="footer m-0 pl-0">
    <Footer />
  </dir>
</div>
</template>

<script>
import Router from "../router/router";
import Header from "./layout/Header.vue"
import Navigation from "./layout/Navigation.vue"
import Footer from "./layout/Footer.vue"
import axios from "axios";
import {mapGetters} from "vuex";

export default {
  data: function () {
    return {
      registeredEmail: '',
      registeredPassword : '',
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
      }
    }
  },

  components: {
    Header,
    Navigation,
    Footer
  },

  methods: {
    login() {
      // TODO ログイン処理
        this.registeredEmail = this.registrationUserData.email
        this.registeredPassword = this.registrationUserData.password
        this.loading = true
        const params = {
          email: `${this.registeredEmail}`,
          password: `${this.registeredPassword}`,
        }
        axios
          .post("/api/v1/auth/sign_in", params)
          .then(response => {
            localStorage.setItem("access-token", response.headers["access-token"])
            localStorage.setItem("uid", response.headers["uid"])
            localStorage.setItem("client", response.headers["client"])

            // console.log(response.data.data) 
            this.loginedUserData = response.data.data
            console.log(this.loginedUserData)

            // Vuex store
            this.$store.dispatch('userData/update', this.loginedUserData)
            this.$store.dispatch('auth/updateLogin', true)
            Router.push("/account_info")
          })
          .catch(e => {
            // TODO: 適切な Error 表示
            if (e.response) {
              console.log(e.response.data)
              console.log(e.response.status)
              console.log(e.response.headers)
            } else if (error.request) {
              console.log(e.request)
            } else {
              console.log('Error', e.message)
            }
          })
          .finally(() => {
            this.loading = false
          })
        console.log("hi")

        this.goToAccountInfo()
      
    },
    goToAccountInfo() {
      Router.push("/account_info")
    },
  },
  computed: {
    ...mapGetters([
      'registrationUserData',
    ])
  }
}

</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>

