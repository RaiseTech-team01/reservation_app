<template>
  <div class="main m-0">
    <dir class="header m-0 text-center pl-0">
      <Header />
    </dir>
    <div class="container mt-16">
      <main>
        <div class="mt-5 py-5 text-center">
          <h2>入力内容の確認</h2>
        </div>
        <div class="row g-5 flex justify-center">
          <div class="col-md-7 col-lg-8">
            <form class="needs-validation" @submit="goToComplete" novalidate>
              <table class="table">
                <thead>
                  <tr>
                    <th>種別</th>
                    <th>入力内容</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>名前</td>
                    <td>
                      {{
                        registrationUserData.last_name +
                        " " +
                        registrationUserData.first_name
                      }}
                    </td>
                  </tr>
                  <tr>
                    <td>ふりがな</td>
                    <td>
                      {{
                        registrationUserData.last_furigana +
                        " " +
                        registrationUserData.first_furigana
                      }}
                    </td>
                  </tr>
                  <tr>
                    <td>メールアドレス</td>
                    <td>
                      {{ registrationUserData.email }}
                    </td>
                  </tr>
                  <tr>
                    <td>電話番号</td>
                    <td>
                      {{ registrationUserData.tel }}
                    </td>
                  </tr>
                  <tr>
                    <td>性別</td>
                    <td>
                      {{ registrationUserData.gender }}
                    </td>
                  </tr>
                  <tr>
                    <td>生年月日</td>
                    <td>
                      {{ registrationUserData.birthday }}
                    </td>
                  </tr>
                  <tr>
                    <td>住所</td>
                    <td>
                      {{ registrationUserData.address }}
                    </td>
                  </tr>
                  <tr>
                    <td>パスワード</td>
                    <td>
                      {{ getHiddenPasswordString(false) }}
                    </td>
                  </tr>
                  <tr>
                    <td>パスワード（確認）</td>
                    <td>
                      {{ getHiddenPasswordString(true) }}
                    </td>
                  </tr>
                </tbody>
              </table>
            </form>
          </div>
        </div>
        <div class="text-center mt-5">
          <button
            type="button"
            class="m-3 px-5 btn btn-lg btn-block text-white bg-rt-cyan"
            @click.prevent="goToComplete"
          >
            登　録
          </button>
          <button
            type="button"
            class="m-3 px-5 btn btn-lg btn-block btn-outline-cyan"
            @click.prevent="back"
          >
            戻　る
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
import { mapGetters } from "vuex"
import axios from "axios"

export default {
  data: function () {
    return {
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
          title: "新規登録確認",
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
    goToComplete: function () {
      const addUserParams = this.$store.getters.registrationUserData
      addUserParams.name =
        addUserParams.last_name + " " + addUserParams.first_name
      addUserParams.furigana =
        addUserParams.last_furigana + " " + addUserParams.first_furigana
      // 以下の書式でいらないデータを削除
      delete addUserParams.errs

      axios
        .post("/api/v1/auth/", addUserParams)
        .then(function (response) {
          console.log(response)
          localStorage.setItem("access-token", response.headers["access-token"])
          localStorage.setItem("uid", response.headers["uid"])
          localStorage.setItem("client", response.headers["client"])
          Router.push("/sign_up_complete")
        })
        .catch((error) => {
          console.log(error.response.data.errors.full_messages)
          this.$store.dispatch(
            "registrationUserData/updateErr",
            error.response.data.errors.full_messages
          )
          Router.push({
            name: "RegistrationForm",
            params: { isFirstDraw: false },
          })
        })
      // this.$store.dispatch('registrationUserData/post')
    },
    back() {
      Router.back()
    },
    toForm() {
      Router.push({
        name: "RegistrationForm",
        params: { isFirstDraw: false },
      })
    },
    getHiddenPasswordString(isConfirmation) {
      const passwordLen = isConfirmation
        ? this.$store.getters.registrationUserData.password_confirmation.length
        : this.$store.getters.registrationUserData.password.length
      return "*".repeat(passwordLen)
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
}
</style>

// calc age // name: `${this.registrationUserData.last_name} + " " +
${this.registrationUserData.first_name}`, // furigana:
`${this.registrationUserData.last_furigana} + " " +
${this.registrationUserData.first_furigana}`, // // email:
`${this.registrationUserData.email}`, // tel:
`${this.registrationUserData.tel}`, // birthday:
`${this.registrationUserData.birthday}`, // gender:
`${this.registrationUserData.gender}`, // address:
`${this.registrationUserData.address}`, // password:
`${this.registrationUserData.password}`, // password_confirmation:
`${this.registrationUserData.password_confirmation}`, // }
