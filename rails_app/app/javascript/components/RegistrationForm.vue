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
            <div class="col-12 p-2 alert alert-danger" v-show="hasError()">
              <p
                class="fs-6 m-0"
                v-for="(e, index) in errorMessage"
                :key="index"
              >
                {{ e }}
              </p>
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
                <label for="tel" class="form-label"
                  >性別 <span class="text-muted">必須</span></label
                >
                <select
                  class="form-select"
                  aria-label="Default select example"
                  v-model="userData.gender"
                  required
                >
                  <option selected disabled value="">選択...</option>
                  <option value="不明">不明</option>
                  <option value="男性">男性</option>
                  <option value="女性">女性</option>
                  <option value="適用不能">適用不能</option>
                </select>
                <div class="invalid-feedback">性別を記載してください。</div>
              </div>
              <div class="col-12">
                <label for="tel" class="form-label"
                  >生年月日 <span class="text-muted">必須</span></label
                >

                <div class="row">
                  <div class="col-3">
                    <select
                      id="sel-year"
                      class="form-select"
                      v-model="userData.birth_year"
                      required
                    >
                      <option selected disabled value="">選択...</option>
                      <option
                        v-for="(item, index) in getYearList()"
                        :key="index"
                        :value="item"
                      >
                        {{ item }}
                      </option>
                    </select>
                    <div class="invalid-feedback">年を入力してください。</div>
                  </div>
                  年
                  <div class="col-3">
                    <select
                      id="sel-month"
                      class="form-select"
                      v-model="userData.birth_month"
                      required
                    >
                      <option selected disabled value="">選択...</option>
                      <option
                        v-for="(item, index) in getMonthList()"
                        :key="index"
                        :value="item"
                      >
                        {{ item }}
                      </option>
                    </select>
                    <div class="invalid-feedback">月を入力してください。</div>
                  </div>
                  月
                  <div class="col-3">
                    <select
                      id="sel-day"
                      class="form-select"
                      v-model="userData.a_birth_day"
                      required
                    >
                      <option selected disabled value="">選択...</option>
                      <option
                        v-for="(item, index) in getDayList()"
                        :key="index"
                        :value="item"
                      >
                        {{ item }}
                      </option>
                    </select>
                    <div class="invalid-feedback">日を入力してください。</div>
                  </div>
                  日
                </div>
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
        birth_year: "",
        birth_month: "",
        a_birth_day: "",
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
      return this.errorMessage.length !== 0
    },
    confirm() {
      this.userData.birthday = this.makeBirthDate()
      console.log(this.userData)
      this.$store.dispatch("registrationUserData/update", this.userData)
      //  画面遷移先を変更
      Router.push("/sign_up_confirm")
    },
    back() {
      Router.push("/login")
    },
    makeBirthDate() {
      const year = this.userData.birth_year
      const month = ("0" + this.userData.birth_month).slice(-2)
      const day = ("0" + this.userData.a_birth_day).slice(-2)
      return year + month + day
    },
    makeList(from, to, order) {
      let num = to - from + 1
      let arr = []
      switch (order) {
        case "ascend":
          for (let i = 0; i < num; i++) {
            arr.push(from + i)
          }
          break
        case "descend":
          for (let i = num - 1; i >= 0; i--) {
            arr.push(from + i)
          }
          break
      }
      return arr
    },
    getYearList() {
      const thisYear = new Date(Date.now()).getFullYear()
      return this.makeList(1930, thisYear, "descend")
    },
    getMonthList() {
      return this.makeList(1, 12, "ascend")
    },
    getDayList() {
      return this.makeList(1, 31, "ascend")
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
      if (this.registrationUserData.birthday) {
        this.userData.birth_year = this.registrationUserData.birthday.slice(
          0,
          4
        )
        this.userData.birth_month = String(
          parseInt(this.registrationUserData.birthday.slice(4, 6))
        )
        this.userData.a_birth_day = String(
          parseInt(this.registrationUserData.birthday.slice(6, 8))
        )
      }
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
    this.errorMessage = this.$store.getters.registrationUserData.errs
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
