<template>
<div class="main m-0">
  <div class="calendar">
    <Calendar />
  </div>
  <div class="timetable">
    <Timetable />
  </div>
  <div id="fa_container"></div>
  <dir class="header m-0 text-center pl-0">
    <Header />
  </dir>
  <main>
    <dir class="navigation hidden md:block m-0 p-0">
      <Navigation/>
    </dir>
    <div class="flex justify-center">
      <div class="bg-gray-300 info-container">
        <div>
          <h3 class="mt-10 ml-4 text-xl text-blue-800">
            <a class="font-bold hover:text-blue-500" href="index.html">トップ</a>
            <span> > </span>
            <a class="font-bold hover:text-blue-500" href="index.html">予約登録入力</a>
          </h3>
        </div>
        <div class="mt-16">
          <div>
            <p class="whitespace-nowrap flex justify-around md:justify-center md:space-x-12 md:transform md:scale-125 md:flex-none">
              <span class="arrow-block">入力</span>
              <span class="arrow-block-inactive">確認</span>
              <span class="arrow-block-inactive">登録</span>
            </p>
          </div>
        </div>
        <div>
          <h2 class="mt-16 mb-8 font-bold text-3xl md:text-4xl text-center text-blue-800">ご希望のご予約内容</h2>
          <form>
            <table class="m-2 md:m-10 table-auto">
              <tr>
                <td class="text-3xl mg:text-4xl whitespace-nowrap form-table-padding p-4 md:p-6 text-blue-800">店舗</td>
                <td class="space-x-4">
                  <div class="flex justify-between space-x-4 md:flex-none">
                    <input class="w-full md:w-96 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-3xl" name="store_name" type="text" placeholder="イロハ駅前店" />
                  </div>
                </td>
              </tr>
              <tr>
                <td class="text-3xl mg:text-4xl whitespace-nowrap form-table-padding p-4 md:p-6 text-blue-800">日付</td>
                <td>
                  <div class="flex justify-start space-x-2 md:flex-none">
                    <select class="w-20 md:w-20 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-blue-800 text-3xl cursor-pointer" name="month" type="text" required @click="show_calendar">
                    </select>
                    <span class="inline-block px-2 text-3xl md:text-4xl whitespace-nowrap form-table-padding text-blue-800">月</span>
                    <select class="w-20 md:w-20 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-blue-800 text-3xl cursor-pointer" name="day" type="text" required @click="show_calendar">
                    </select>
                    <span class="inline-block px-2 text-3xl md:text-4xl whitespace-nowrap form-table-padding text-blue-800">日</span>
                  </div>
                </td>
              </tr>
              <tr>
                <td class="text-2xl md:text-3xl whitespace-nowrap form-table-padding p-4 md:p-6 text-blue-800">時間帯</td>
                <td>
                  <div class="flex justify-start space-x-2 md:flex-none">
                    <select class="w-20 md:w-20 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-blue-800 text-3xl cursor-pointer" name="hour" type="text" required @click="show_timetable">
                    </select>
                    <span class="inline-block px-2 text-3xl md:text-4xl whitespace-nowrap form-table-padding text-blue-800">時</span>
                    <select class="w-20 md:w-20 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-blue-800 text-3xl cursor-pointer" name="minute" type="text" required @click="show_timetable">
                    </select>
                    <span class="inline-block px-2 text-3xl md:text-4xl whitespace-nowrap form-table-padding text-blue-800">分</span>
                  </div>
                </td>
              </tr>
              <tr>
                <td class="text-2xl md:text-3xl whitespace-nowrap form-table-padding p-4 md:p-6 text-blue-800">ご利用人数</td>
                <td>
                  <input class="w-1/3 md:w-28 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-3xl text-blue-800" name="guests_number" type="number" min="1" step="1" required placeholder="2" />
                  <span class="inline-block px-2 text-3xl md:text-4xl whitespace-nowrap form-table-padding text-blue-800">名様</span>
                </td>
              </tr>
              <tr>
                <td class="text-2xl md:text-3xl whitespace-nowrap form-table-padding p-4 md:p-6 text-blue-800">ご予算</td>
                <td>
                  <input class="w-1/2 md:w-40 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-3xl text-blue-800" name="price" type="number" min="500" step="500" required placeholder="3000" />
                  <span class="text-3xl md:text-4xl whitespace-nowrap form-table-padding p-4 md:p-6 text-blue-800">円</span>
                </td>
              </tr>
            </table>
            <div>
              <p class="flex justify-start space-x-8 mt-10 md:ml-16 ml-8">
                <label>
                  <input class="radiox inline-block mr-2 align-middle transform scale-150" type="checkbox" name="privacy_policy" value="yes" required>
                  <span class="mt-4 mb-4 text-2xl md:text-3xl font-bold align-middle text-blue-800 hover:text-blue-600">個人情報保護方針に同意する</span>
                </label>
              </p>
            </div>
            <div class="text-center space-x-4 md:space-x-8 mt-14 mb-28">
              <input class="inline-block w-2/5 py-2 rounded-xl font-bold bg-yellow-300 text-4xl text-blue-800 cursor-pointer hover:bg-yellow-200 hover:text-blue-600 active:bg-red-200" type="button" value="送信確認" @click.prevent="goToConfirm" />
            </div>
          </form>
        </div>
      </div>
    </div>
    <dir class="footer m-0 pl-0">
      <Footer />
    </dir>
  </main>
</div>
</template>

<script>
import Router from "../router/router"
import Header from "./layout/Header.vue"
import Navigation from "./layout/Navigation.vue"
import Footer from "./layout/Footer.vue"
import Calendar from "./dialog/Calendar.vue"
import Timetable from "./dialog/Timetable.vue"

export default {
  data: function () {
    return {
    }
  },

  components: {
    Header,
    Navigation,
    Footer,
    Calendar,
    Timetable
  },

  methods: {
    show_calendar(event) {
      if (!$("#calendar-dialog").is(':visible')) {
        event.target.blur()
        $("#calendar-bg").show()
        $("#calendar-dialog").show("normal", function() {
          $('body, html').css({"overflow": "hidden", "height": "100%"});
        });
      }
    },
    show_timetable(event) {
      if (!$("#timetable-dialog").is(':visible')) {
        event.target.blur()
        $("#timetable-bg").show()
        $("#timetable-dialog").show("normal", function() {
          $('body, html').css({"overflow": "hidden", "height": "100%"});
        });
      }
    },
    goToConfirm() {
      Router.push("/reservation_confirm")
    },
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
.radiox {
  transform: scale(2, 2);
}
</style>
