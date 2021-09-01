<template>
  <div class="main m-0">
    <dir class="header m-0 text-center pl-0">
      <Header />
    </dir>
    <main>
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
                    <td>店舗名</td>
                    <td>
                      {{ userReservationFormData.store_name }}
                    </td>
                  </tr>
                  <tr>
                    <td>予約日</td>
                    <td>
                      {{ makeDateStr() }}
                    </td>
                  </tr>
                  <tr>
                    <td>開始時刻</td>
                    <td>
                      {{ makeTimeStr() }}
                    </td>
                  </tr>
                  <tr>
                    <td>ご利用人数</td>
                    <td>
                      {{ userReservationFormData.number_people }}
                    </td>
                  </tr>
                  <tr>
                    <td>ご予算</td>
                    <td>
                      {{ userReservationFormData.budget }}
                    </td>
                  </tr>
                  <tr>
                    <td>個人情報保護方針</td>
                    <td>同意する</td>
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
    </main>
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
      breadClumbList: [
        {
          title: "トップ",
          href: "/home/top",
        },
        {
          title: "予約登録確認",
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

  computed: {
    ...mapGetters(["userReservationFormData", "userData"]),
  },

  methods: {
    convertTwoDigit(value) {
      return ("0" + value).slice(-2)
    },
    makeDateStr() {
      return (
        this.userReservationFormData.date.getFullYear() +
        "-" +
        this.convertTwoDigit(this.userReservationFormData.date.getMonth() + 1) +
        "-" +
        this.convertTwoDigit(this.userReservationFormData.date.getDate())
      )
    },
    makeTimeStr() {
      return (
        this.userReservationFormData.hour +
        ":" +
        this.userReservationFormData.minute
      )
    },
    goToComplete() {
      // Router.push("/reservation_complete")
      var addReservationParams = [] // 配列を新しく定義する
      addReservationParams.store_name = this.userReservationFormData.store_name
      addReservationParams.date_on =
        // 日にち
        this.makeDateStr() +
        " " +
        // 時間
        this.makeTimeStr()
      addReservationParams.date_at = addReservationParams.date_on
      addReservationParams.number_people =
        this.userReservationFormData.number_people
      addReservationParams.menu = this.userReservationFormData.menu
      addReservationParams.budget = this.userReservationFormData.budget
      addReservationParams.inquiry = this.userReservationFormData.inquiry

      addReservationParams.user_id = this.userData.id
      // store_idがわからないので、１を指定しておく
      // atokara 後から編集
      addReservationParams.store_id = 1
      // 以下の書式でいらないデータを削除
      delete addReservationParams.errs
      // delete addReservationParams.date;
      // delete addReservationParams.hour;
      // delete addReservationParams.minute;
      console.log(addReservationParams)
      // 配列をaxiosで送れるオブジェクトへ変換
      var convertAddReservationParams = Object.assign({}, addReservationParams)
      console.log(convertAddReservationParams)

      var key_headers = {
        headers: {
          Accept: "application/json",
          "access-token": localStorage.getItem("access-token"),
          uid: localStorage.getItem("uid"),
          client: localStorage.getItem("client"),
        },
      }
      axios
        .post(
          "/api/v1/user/reservations",
          convertAddReservationParams,
          key_headers
        )
        .then(function (response) {
          console.log(response)
          Router.push("/reservation_complete")
        })
        .catch((error) => {
          console.log(error.response.data.error)
          const errs = error.response.data.error
          this.$store.dispatch(
            "userReservationFormData/updateErr",
            this.isTypeArray(errs) ? errs : [errs]
          )
          Router.push({
            name: "ReservationForm",
            params: { isFirstDraw: false },
          })
        })
    },
    isTypeArray(val) {
      var toString = Object.prototype.toString
      return toString.call(val) === "[object Array]"
    },
    getHiddenPasswordString(isConfirmation) {
      const passwordLen = isConfirmation
        ? this.$store.getters.registrationUserData.password_confirmation.length
        : this.$store.getters.registrationUserData.password.length
      return "*".repeat(passwordLen)
    },
    back() {
      Router.back()
    },
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
