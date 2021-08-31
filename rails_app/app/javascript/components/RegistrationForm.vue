<template>
  <div class="main m-0">
    <dir class="storeheader m-0 text-center">
      <Header />
    </dir>
    <div class="container mt-16">
      <main>
        <div class="mt-5 py-5 text-center">
          <h2>アカウント登録</h2>
        </div>
        <div class="row g-5 mb-4 flex justify-center">
          <div class="col-md-7 col-lg-8">
            <div class="col-12 alert alert-danger" v-show="hasError()">
              <p>{{ errorMessage }}</p>
            </div>
            <form class="row g-3 needs-validation" novalidate>
              <div class="col-12">
                <label for="firstName" class="form-label"
                  >名前 <span class="text-muted">必須</span></label
                >
                <div class="row">
                  <div class="col">
                    <input
                      type="text"
                      class="form-control was-validated"
                      id="firstName"
                      placeholder="居酒屋"
                      v-model="userData.last_name"
                      required
                    />
                    <div class="invalid-feedback">姓を記載してください。</div>
                  </div>
                  <div class="col">
                    <input
                      type="text"
                      class="form-control was-validated"
                      id="lastName"
                      placeholder="太郎"
                      v-model="userData.first_name"
                      required
                    />
                    <div class="invalid-feedback">名を記載してください。</div>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <label for="firstName" class="form-label"
                  >ふりがな <span class="text-muted">必須</span></label
                >
                <div class="row">
                  <div class="col">
                    <input
                      type="text"
                      class="form-control"
                      id="firstNameKana"
                      placeholder="いざかや"
                      v-model="userData.last_furigana"
                      required
                    />
                    <div class="invalid-feedback">
                      姓のふりがなを記載してください。
                    </div>
                  </div>
                  <div class="col">
                    <input
                      type="text"
                      class="form-control"
                      id="firstNameKana"
                      placeholder="たろう"
                      v-model="userData.first_furigana"
                      required
                    />
                    <div class="invalid-feedback">
                      名のふりがなを記載してください。
                    </div>
                  </div>
                </div>
              </div>
              <div class="col-12">
                <label for="email" class="form-label"
                  >メールアドレス <span class="text-muted">必須</span></label
                >
                <input
                  type="email"
                  class="form-control"
                  id="email"
                  placeholder="you@example.com"
                  v-model="userData.email"
                  required
                />
                <div class="invalid-feedback">
                  有効なメールアドレスを記載してください。
                </div>
              </div>
              <div class="col-12">
                <label for="tel" class="form-label"
                  >電話番号 <span class="text-muted">必須</span></label
                >
                <input
                  type="tel"
                  class="form-control"
                  id="tel"
                  placeholder="080-1111-2222"
                  v-model="userData.tel"
                  required
                />
                <div class="invalid-feedback">電話番号を記載してください。</div>
              </div>
              <div class="col-12">
                <label for="address" class="form-label"
                  >住所 <span class="text-muted">必須</span></label
                >
                <input
                  type="text"
                  class="form-control"
                  id="address"
                  placeholder="東京都台東区駒形1-1"
                  v-model="userData.address"
                  required
                />
                <div class="invalid-feedback">住所を記載してください。</div>
              </div>
              <div class="col-12">
                <label for="password" class="form-label"
                  >パスワード <span class="text-muted">必須</span></label
                >
                <input
                  type="password"
                  class="form-control"
                  id="password"
                  minlength="6"
                  v-model="userData.password"
                  required
                />
                <div class="invalid-feedback">
                  パスワード（6文字以上）を入力してください。
                </div>
              </div>
              <div class="col-12">
                <label for="password-confirm" class="form-label"
                  >パスワード（確認）
                  <span class="text-muted">必須</span></label
                >
                <input
                  type="password"
                  class="form-control"
                  id="password-confirm"
                  minlength="6"
                  v-model="userData.password_confirmation"
                  required
                />
                <div class="invalid-feedback">
                  パスワード（6文字以上）を入力してください。
                </div>
              </div>
              <div class="text-center">
                <button
                  type="submit"
                  class="m-3 px-5 btn btn-lg btn-block text-white bg-rt-cyan"
                >
                  登録確認
                </button>
                <button
                  type="button"
                  class="m-3 px-5 btn btn-lg btn-block btn-outline-cyan"
                  @click.prevent="back"
                >
                  戻　る
                </button>
              </div>
            </form>
          </div>
        </div>
      </main>
    </div>
  </div>
</template>

<script>
import Router from "../router/router"
import Header from "./layout/Header.vue"
import Footer from "./layout/Footer.vue"
import BreadClumbList from "./commons/layouts/BreadClumbList.vue"
import { mapGetters } from "vuex"

export default {
  data: function () {
    return {
      errorMessage: "",
      userData: {
        first_name: "",
        last_name: "",
        email: "",
        first_furigana: "",
        last_furigana: "",
        tel: "",
        birthday: "",
        gender: "",
        address: "",
        password: "",
        password_confirmation: "",
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
          title: "新規登録入力",
        },
      ],
    }
  },
  props: {
    isFirstDraw: Boolean,
  },
  components: {
    Header,
    Footer,
    BreadClumbList,
  },
  methods: {
    hasError() {
      return !!this.errorMessage
    },
    confirm() {
      console.log(this.userData)
      this.$store.dispatch("registrationUserData/update", this.userData)
      //  画面遷移先を変更
      Router.push("/sign_up_confirm")
    },
    back() {
      Router.push("/login")
    },
    // Vuexに保管したデータをローカル変数に反映
    reflectUserDataByVuex() {
      this.userData.first_name = this.registrationUserData.first_name
      this.userData.last_name = this.registrationUserData.last_name
      this.userData.email = this.registrationUserData.email
      this.userData.first_furigana = this.registrationUserData.first_furigana
      this.userData.last_furigana = this.registrationUserData.last_furigana
      this.userData.tel = this.registrationUserData.tel
      this.userData.birthday = this.registrationUserData.birthday
      this.userData.gender = this.registrationUserData.gender
      this.userData.address = this.registrationUserData.address
      this.userData.password = this.registrationUserData.password
      this.userData.password_confirmation =
        this.registrationUserData.password_confirmation
    },
    // エラーメッセージを初期化
    initializeErrMessage() {
      this.$store.dispatch("registrationUserData/updateErr", "")
    },
    appendBootstrapScriptTag() {
      let linkEl = document.createElement("link")
      linkEl.setAttribute(
        "href",
        "https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
      )
      linkEl.setAttribute("rel", "stylesheet")
      linkEl.setAttribute(
        "integrity",
        "sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
      )
      linkEl.setAttribute("crossorigin", "anonymous")
      document.head.appendChild(linkEl)
    },
    initializeValidation(validatedCallback) {
      const instance0 = this
      this.$nextTick(function () {
        console.log(this)
        const instance = this
        //("use strict");

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll(".needs-validation")

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms).forEach(function (form) {
          form.addEventListener(
            "submit",
            function (event) {
              if (!form.checkValidity()) {
                console.log("invalid")
                event.preventDefault()
                event.stopPropagation()
              } else {
                console.log("valid")
                console.log("instance:")
                console.log(instance)
                console.log("instance0:")
                console.log(instance0)
                event.preventDefault()
                event.stopPropagation()
                console.log(this)

                validatedCallback()
              }
              form.classList.add("was-validated")
            },
            false
          )
        })
      })
    },
  },
  mounted() {
    this.initializeValidation(() => {
      console.log("success validation")
      this.confirm()
    })
  },
  computed: {
    ...mapGetters(["registrationUserData"]),
  },
  created: function () {
    console.log("this.userData", this.userData)
    console.log("this.registrationUserData", this.registrationUserData)
    console.log("fd", this.$route.params.isFirstDraw)
    if (this.$route.params.isFirstDraw) {
      this.initializeErrMessage()
    } else {
      this.reflectUserDataByVuex()
    }
    console.log("this.userData", this.userData)
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
