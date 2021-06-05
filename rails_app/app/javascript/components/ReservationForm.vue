<template>
<div class="main m-0">
  <dir class="header m-0 text-center pl-0">
    <Header />
  </dir>
  <main>
    <div class="flex justify-center">
      <div class="bg-gray-300" style="width: 766px">
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
                    <input class="w-full md:w-96 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-3xl" name="store_name" type="text" />
                  </div>
                </td>
              </tr>
              <tr>
                <td class="text-3xl mg:text-4xl whitespace-nowrap form-table-padding p-4 md:p-6 text-blue-800">日付</td>
                <td>
                  <div class="flex justify-start space-x-2 md:flex-none">
                    <select class="w-20 md:w-20 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-blue-800 text-3xl cursor-pointer" name="month" type="text">
                      <option class="text-xl" value="1">1</option>
                      <option class="text-xl" value="2">2</option>
                      <option class="text-xl" value="3">3</option>
                      <option class="text-xl" value="4">4</option>
                      <option class="text-xl" value="5">5</option>
                      <option class="text-xl" value="6">6</option>
                      <option class="text-xl" value="7">7</option>
                      <option class="text-xl" value="8">8</option>
                      <option class="text-xl" value="9">9</option>
                      <option class="text-xl" value="10">10</option>
                      <option class="text-xl" value="11">11</option>
                      <option class="text-xl" value="12">12</option>
                    </select>
                    <span class="inline-block px-2 text-3xl md:text-4xl whitespace-nowrap form-table-padding text-blue-800">月</span>
                    <select class="w-20 md:w-20 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-blue-800 text-3xl cursor-pointer" name="day" type="text">
                      <option class="text-xl" value="1">1</option>
                      <option class="text-xl" value="2">2</option>
                      <option class="text-xl" value="3">3</option>
                      <option class="text-xl" value="4">4</option>
                      <option class="text-xl" value="5">5</option>
                      <option class="text-xl" value="6">6</option>
                      <option class="text-xl" value="7">7</option>
                      <option class="text-xl" value="8">8</option>
                      <option class="text-xl" value="9">9</option>
                      <option class="text-xl" value="10">10</option>
                      <option class="text-xl" value="11">11</option>
                      <option class="text-xl" value="12">12</option>
                      <option class="text-xl" value="13">13</option>
                      <option class="text-xl" value="14">14</option>
                      <option class="text-xl" value="15">15</option>
                      <option class="text-xl" value="16">16</option>
                      <option class="text-xl" value="17">17</option>
                      <option class="text-xl" value="18">18</option>
                      <option class="text-xl" value="19">19</option>
                      <option class="text-xl" value="20">20</option>
                      <option class="text-xl" value="21">21</option>
                      <option class="text-xl" value="22">22</option>
                      <option class="text-xl" value="23">23</option>
                      <option class="text-xl" value="24">24</option>
                      <option class="text-xl" value="25">25</option>
                      <option class="text-xl" value="26">26</option>
                      <option class="text-xl" value="27">27</option>
                      <option class="text-xl" value="28">28</option>
                      <option class="text-xl" value="29">29</option>
                      <option class="text-xl" value="30">30</option>
                      <option class="text-xl" value="31">31</option>
                    </select>
                    <span class="inline-block px-2 text-3xl md:text-4xl whitespace-nowrap form-table-padding text-blue-800">日</span>
                  </div>
                </td>
              </tr>
              <tr>
                <td class="text-2xl md:text-3xl whitespace-nowrap form-table-padding p-4 md:p-6 text-blue-800">時間帯</td>
                <td>
                  <div class="flex justify-start space-x-2 md:flex-none">
                    <select class="w-20 md:w-20 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-blue-800 text-3xl cursor-pointer" name="hour" type="text">
                      <option class="text-xl" value="1">1</option>
                      <option class="text-xl" value="2">2</option>
                      <option class="text-xl" value="3">3</option>
                      <option class="text-xl" value="4">4</option>
                      <option class="text-xl" value="5">5</option>
                      <option class="text-xl" value="6">6</option>
                      <option class="text-xl" value="7">7</option>
                      <option class="text-xl" value="8">8</option>
                      <option class="text-xl" value="9">9</option>
                      <option class="text-xl" value="10">10</option>
                      <option class="text-xl" value="11">11</option>
                      <option class="text-xl" value="12">12</option>
                      <option class="text-xl" value="13">13</option>
                      <option class="text-xl" value="14">14</option>
                      <option class="text-xl" value="15">15</option>
                      <option class="text-xl" value="16">16</option>
                      <option class="text-xl" value="17">17</option>
                      <option class="text-xl" value="18">18</option>
                      <option class="text-xl" value="19">19</option>
                      <option class="text-xl" value="20">20</option>
                      <option class="text-xl" value="21">21</option>
                      <option class="text-xl" value="22">22</option>
                      <option class="text-xl" value="23">23</option>
                    </select>
                    <span class="inline-block px-2 text-3xl md:text-4xl whitespace-nowrap form-table-padding text-blue-800">時</span>
                    <select class="w-20 md:w-20 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-blue-800 text-3xl cursor-pointer" name="minute" type="text">
                      <option class="text-xl" value="00">00</option>
                      <option class="text-xl" value="05">05</option>
                      <option class="text-xl" value="10">10</option>
                      <option class="text-xl" value="15">15</option>
                      <option class="text-xl" value="20">20</option>
                      <option class="text-xl" value="25">25</option>
                      <option class="text-xl" value="30">30</option>
                      <option class="text-xl" value="35">35</option>
                      <option class="text-xl" value="40">40</option>
                      <option class="text-xl" value="45">45</option>
                      <option class="text-xl" value="50">50</option>
                      <option class="text-xl" value="55">55</option>
                    </select>
                    <span class="inline-block px-2 text-3xl md:text-4xl whitespace-nowrap form-table-padding text-blue-800">分</span>
                  </div>
                </td>
              </tr>
              <tr>
                <td class="text-2xl md:text-3xl whitespace-nowrap form-table-padding p-4 md:p-6 text-blue-800">ご利用人数</td>
                <td>
                  <input class="w-1/3 md:w-28 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-3xl" name="guests_number" type="number" />
                  <span class="inline-block px-2 text-3xl md:text-4xl whitespace-nowrap form-table-padding text-blue-800">名様</span>
                </td>
              </tr>
              <tr>
                <td class="text-2xl md:text-3xl whitespace-nowrap form-table-padding p-4 md:p-6 text-blue-800">ご予算</td>
                <td>
                  <input class="w-1/2 md:w-40 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-3xl" type="price" />
                  <span class="text-3xl md:text-4xl whitespace-nowrap form-table-padding p-4 md:p-6 text-blue-800">円</span>
                </td>
              </tr>
            </table>
            <div>
              <h3 class="mt-8 mb-8 font-bold text-2xl md:text-3xl text-center text-blue-800"><span class="underline">個人情報保護方針</span>への同意</h3>
              <p class="flex justify-center space-x-8">
                <label>
                  <input class="radiox inline-block mr-2 align-middle" type="radio" name="privacy_policy" value="yes">
                  <span class="mt-4 mb-4 text-xl md:text-2xl font-bold text-center align-middle text-blue-800 hover:text-blue-600">同意する</span>
                </label>
                <label>
                  <input class="radiox inline-block mx-2 align-middle" type="radio" name="privacy_policy" value="no">
                  <span class="mt-4 mb-4 text-xl md:text-2xl font-bold text-center align-middle text-blue-800 hover:text-blue-600">同意しない</span>
                </label>
              </p>
            </div>
            <div class="text-center space-x-4 md:space-x-8 mt-14 mb-28">
              <input class="inline-block w-2/5 py-2 rounded-xl font-bold bg-yellow-300 text-4xl text-blue-800 cursor-pointer hover:bg-yellow-200 hover:text-blue-600 active:bg-red-200" type="button" value="送信確認" />
              <input class="inline-block w-2/5 py-2 rounded-xl font-bold bg-yellow-300 text-4xl text-blue-800 cursor-pointer hover:bg-yellow-200 hover:text-blue-600 active:bg-red-200" type="button" value="戻　る" />
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
import Router from "../router/router";
import Header from "./layout/Header.vue"
import Navigation from "./layout/Navigation.vue"
import Footer from "./layout/Footer.vue"

export default {
  data: function () {
    return {
    }
  },

  components: {
    Header,
    Navigation,
    Footer
  },

  methods: {
  }
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
