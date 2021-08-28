<template>
  <div class="main m-0">
    <dir class="header m-0 text-center pl-0">
      <Header />
    </dir>
    <main>
      <dir class="navigation hidden md:block m-0 p-0">
        <Navigation :currentIndex="0" />
      </dir>
      <div class="flex justify-center">
        <div class="bg-gray-300 info-container">
          <BreadClumbList :bcList="breadClumbList" />
          <div class="mt-16">
            <div>
              <p
                class="
                  text-center
                  whitespace-nowrap
                  flex
                  justify-around
                  md:justify-center
                  md:space-x-12
                  md:transform
                  md:scale-125
                  md:flex-none
                "
              >
                <span class="arrow-block-inactive">入力</span>
                <span class="arrow-block">確認</span>
                <span class="arrow-block-inactive">登録</span>
              </p>
            </div>
          </div>
          <div>
            <h2
              class="
                mt-16
                mb-8
                font-bold
                text-3xl
                md:text-4xl
                text-center text-blue-800
              "
            >
              ご予約内容は下記でよろしいですか？
            </h2>
            <form>
              <table
                class="m-2 mt-10 table-auto max-w-full md:w-full md:text-center"
              >
                <tr class="h-24">
                  <td
                    class="
                      block
                      md:w-1/5 md:table-cell
                      text-3xl
                      md:text-4xl
                      form-table-padding
                      md:pl-6
                      text-blue-800
                    "
                  >
                    店舗
                  </td>
                  <td class="block md:table-cell space-x-4 pb-6 md:pb-0">
                    <div>
                      <p
                        class="
                          inline-block
                          md:pr-16
                          text-3xl text-blue-800
                          font-bold
                        "
                      >
                        <!--                                                atode 後で編集-->
                        どうやってもってこうよう。
                      </p>
                    </div>
                  </td>
                </tr>
                <tr class="h-24">
                  <td
                    class="
                      block
                      md:table-cell
                      text-3xl
                      md:text-4xl
                      form-table-padding
                      md:pl-6
                      text-blue-800
                    "
                  >
                    日付
                  </td>
                  <td class="block md:table-cell pb-6 md:pb-0">
                    <div>
                      <p
                        class="
                          inline-block
                          md:pr-16
                          text-3xl text-blue-800
                          font-bold
                        "
                      >
                        {{ userReservationFormData.date }}
                      </p>
                    </div>
                  </td>
                </tr>
                <tr class="h-24">
                  <td
                    class="
                      block
                      md:table-cell
                      text-3xl
                      form-table-padding
                      md:pl-6
                      text-blue-800
                    "
                  >
                    時間帯
                  </td>
                  <td class="block md:table-cell pb-6 md:pb-0">
                    <p
                      class="
                        inline-block
                        md:pr-16
                        text-3xl text-blue-800
                        font-bold
                        break-all
                      "
                    >
                      {{ userReservationFormData.hour }}:{{
                        userReservationFormData.minute
                      }}～
                    </p>
                  </td>
                </tr>
                <tr class="h-24">
                  <td
                    class="
                      block
                      md:table-cell
                      text-3xl
                      form-table-padding
                      md:pl-6
                      text-blue-800
                      whitespace-nowrap
                    "
                  >
                    ご利用人数
                  </td>
                  <td class="block md:table-cell pb-6 md:pb-0">
                    <p
                      class="
                        inline-block
                        md:pr-16
                        text-3xl text-blue-800
                        font-bold
                      "
                    >
                      {{ userReservationFormData.number_people }}名様
                    </p>
                  </td>
                </tr>
                <tr class="h-24">
                  <td
                    class="
                      block
                      md:table-cell
                      text-3xl
                      form-table-padding
                      md:pl-6
                      text-blue-800
                    "
                  >
                    ご予算
                  </td>
                  <td class="block md:table-cell pb-6 md:pb-0">
                    <p
                      class="
                        inline-block
                        md:pr-16
                        text-3xl text-blue-800
                        font-bold
                      "
                    >
                      {{ userReservationFormData.budget }}円
                    </p>
                  </td>
                </tr>
                <tr class="h-24">
                  <td
                    class="
                      block
                      md:table-cell
                      text-3xl
                      form-table-padding
                      md:pl-6
                      text-blue-800
                    "
                  >
                    個人情報<br class="hidden md:block" />保護方針
                  </td>
                  <td class="block md:table-cell pb-6 md:pb-0">
                    <p
                      class="
                        inline-block
                        md:pr-16
                        text-3xl text-blue-800
                        font-bold
                      "
                    >
                      同意する
                    </p>
                  </td>
                </tr>
              </table>
              <div class="text-center space-x-4 md:space-x-8 mt-14 mb-28">
                <input
                  class="
                    inline-block
                    w-2/5
                    py-2
                    rounded-xl
                    font-bold
                    bg-yellow-300
                    text-4xl text-blue-800
                    cursor-pointer
                    hover:bg-yellow-200 hover:text-blue-600
                    active:bg-red-200
                  "
                  type="button"
                  value="送　信"
                  @click.prevent="goToComplete"
                />
                <input
                  class="
                    inline-block
                    w-2/5
                    py-2
                    rounded-xl
                    font-bold
                    bg-yellow-300
                    text-4xl text-blue-800
                    cursor-pointer
                    hover:bg-yellow-200 hover:text-blue-600
                    active:bg-red-200
                  "
                  type="button"
                  value="戻　る"
                  @click.prevent="back"
                />
              </div>
            </form>
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
    goToComplete() {
      Router.push("/reservation_complete")
      var addReservationParams = [] // 配列を新しく定義する
      addReservationParams.date_on =
        // 日にち
        this.userReservationFormData.date.getFullYear() +
        "-" +
          // JavaScriptの日にちオブジェクトをつくる。月が０から始まる
          //例２）年月日を指定して生成する(2016/3/29)
          // var dt = new Date(2016, 2, 29);
        this.convertTwoDigit(this.userReservationFormData.date.getMonth() + 1) +
        "-" +
        this.convertTwoDigit(this.userReservationFormData.date.getDate()) +
        " " +
        // 時間
        this.userReservationFormData.hour +
        ":" +
        this.userReservationFormData.minute
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
      // delete addReservationParams.errs
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
          this.$store.dispatch(
            "userReservationFormData/updateErr",
            error.response.data.error
          )
          Router.push({
            name: "ReservationForm",
            params: { isFirstDraw: false },
          })
        })
    },

    back() {
      Router.back()
    },
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
}
</style>
