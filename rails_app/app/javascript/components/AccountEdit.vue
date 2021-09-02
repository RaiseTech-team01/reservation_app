<template>
  <div class="main m-0">
    <dir class="header m-0 text-center pl-0">
      <Header :currentIndex="3" />
    </dir>
    <main>
      <div class="mt-5 py-5 text-center">
        <h2>アカウント編集</h2>
      </div>
      <div class="row g-5 mb-4 flex justify-center">
        <div class="col-md-7 col-lg-8">
          <div class="col-12 p-2 alert alert-danger" v-show="hasError()">
            <p class="fs-6 m-0" v-for="(e, index) in errorMessage" :key="index">
              {{ e }}
            </p>
          </div>
          <form class="row g-3 needs-validation" novalidate>
            <div class="col-12">
              <label for="name" class="form-label"
                >名前 <span class="text-muted">必須</span></label
              >
              <div class="row">
                <div class="col">
                  <input
                    type="text"
                    class="form-control was-validated"
                    id="name"
                    placeholder="居酒屋 太郎"
                    v-model="userData.name"
                    required
                  />
                  <div class="invalid-feedback">名前を記載してください。</div>
                </div>
              </div>
            </div>
            <div class="col-12">
              <label for="furigana" class="form-label"
                >ふりがな <span class="text-muted">必須</span></label
              >
              <div class="row">
                <div class="col">
                  <input
                    type="text"
                    class="form-control"
                    id="furigana"
                    placeholder="いざかや たろう"
                    v-model="userData.furigana"
                    required
                  />
                  <div class="invalid-feedback">
                    名前のふりがなを記載してください。
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
              <div class="invalid-feedback">性別を選択してください。</div>
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
                    v-model="editingUserData.birthYear"
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
                  <div class="invalid-feedback">年を選択してください。</div>
                </div>
                年
                <div class="col-3">
                  <select
                    id="sel-month"
                    class="form-select"
                    v-model="editingUserData.birthMonth"
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
                  <div class="invalid-feedback">月を選択してください。</div>
                </div>
                月
                <div class="col-3">
                  <select
                    id="sel-day"
                    class="form-select"
                    v-model="editingUserData.birthDay"
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
                  <div class="invalid-feedback">日を選択してください。</div>
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
            <div class="text-center">
              <button
                type="submit"
                class="m-3 px-5 btn btn-lg btn-block text-white bg-rt-cyan"
              >
                保　存
              </button>
              <button
                type="button"
                class="m-3 px-5 btn btn-lg btn-block btn-outline-cyan"
                @click.prevent="cancel"
              >
                キャンセル
              </button>
            </div>
          </form>
        </div>
      </div>
    </main>
  </div>
</template>

<script>
import Router from "../router/router"
import Header from "./layout/Header.vue"
import Navigation from "./layout/Navigation.vue"
import Footer from "./layout/Footer.vue"
import { mapGetters } from "vuex"
import BreadClumbList from "./commons/layouts/BreadClumbList.vue"

export default {
  data: function () {
    return {
      errorMessage: "",
      breadClumbList: [
        {
          title: "トップ",
          href: "/home/top",
        },
        {
          title: "アカウント設定",
          href: "/api/v1/user/account_info",
        },
        {
          title: "アカウント編集",
        },
      ],
      editingUserData: [
        {
          birthYear: "",
          birthMonth: "",
          birthDay: "",
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
    hasError() {
      return this.errorMessage.length !== 0
    },
    save() {
      // TODO 入力データの保存処理

      this.goToAccountInfo()
    },
    cancel() {
      Router.back()
    },
    goToAccountInfo() {
      Router.push("/api/v1/user/account_info")
    },
    makeBirthDate() {
      const year = this.editingUserData.birthYear
      const month = ("0" + this.editingUserData.birthMonth).slice(-2)
      const day = ("0" + this.editingUserData.birthDay).slice(-2)
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
      this.save()
    })
    const birthDate = this.$store.getters.userData.birthday
    this.editingUserData.birthYear = birthDate.slice(0, 4)
    this.editingUserData.birthMonth = parseInt(birthDate.slice(4, 6))
    this.editingUserData.birthDay = parseInt(birthDate.slice(6, 8))
    this.errorMessage = this.$store.getters.userData.errs
  },
  computed: {
    ...mapGetters(["userData"]),
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
