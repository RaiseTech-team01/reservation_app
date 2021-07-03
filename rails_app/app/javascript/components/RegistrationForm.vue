<template>
<div class="main m-0">
  <dir class="header m-0 text-center pl-0">
    <Header />
  </dir>
  <main>
    <div class="flex justify-center">
      <div class="bg-gray-300 info-container">
        <div>
          <h3 class="mt-10 ml-4 text-xl text-blue-800">
            <a class="font-bold hover:text-blue-500" href="index.html">トップ</a>
            <span> > </span>
            <a class="font-bold hover:text-blue-500" href="index.html">ログイン</a>
            <span> > </span>
            <a class="font-bold hover:text-blue-500" href="index.html">新規登録入力</a>
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
          <h2 class="mt-16 mb-8 font-bold text-3xl md:text-4xl text-center text-blue-800">お客様の情報を入力してください</h2>
          <form>
            <table class="m-2 md:m-10 table-auto">
              <tr>
                <td class="text-3xl mg:text-4xl whitespace-nowrap form-table-padding p-4 md:p-6 text-blue-800">氏名</td>
                <td class="space-x-4">
                  <div class="flex justify-between space-x-2 md:flex-none">
                    <input class="w-1/2 md:w-44 h-12 md:mr-4 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-3xl" type="text" placeholder="田中" />
                    <input class="w-1/2 md:w-44 h-12 md:ml-4 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-3xl" type="text" placeholder="一郎" />
                  </div>
                </td>
              </tr>
              <tr>
                <td class="text-3xl mg:text-4xl whitespace-nowrap form-table-padding p-4 md:p-6 text-blue-800">カナ</td>
                <td>
                  <div class="flex justify-between space-x-2 md:flex-none">
                    <input class="w-1/2 md:w-44 h-12 md:mr-4 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-3xl" type="text" placeholder="タナカ" />
                    <input class="w-1/2 md:w-44 h-12 md:ml-4 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-3xl" type="text" placeholder="イチロウ" />
                  </div>
                </td>
              </tr>
              <tr>
                <td class="text-2xl md:text-3xl whitespace-nowrap form-table-padding p-4 md:p-6 text-blue-800">メール<br class="md:hidden" />アドレス</td>
                <td>
                  <input class="w-full md:w-96 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-3xl" type="email" placeholder="tanaka@sample.com" />
                </td>
              </tr>
              <tr>
                <td class="text-2xl md:text-4xl whitespace-nowrap form-table-padding p-4 md:p-6 text-blue-800">電話<br class="md:hidden" />番号</td>
                <td>
                  <input class="w-full md:w-96 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-3xl" type="tel" placeholder="080-1111-2222" />
                </td>
              </tr>
              <tr>
                <td class="text-3xl md:text-4xl whitespace-nowrap form-table-padding p-4 md:p-6 text-blue-800">年齢</td>
                <td>
                  <input class="w-1/2 md:w-44 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-3xl" type="text" placeholder="28" />
                </td>
              </tr>
              <tr>
                <td class="text-3xl md:text-4xl whitespace-nowrap form-table-padding p-4 md:p-6 text-blue-800">性別</td>
                <td>
                  <input class="w-1/2 md:w-44 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-3xl" type="text" placeholder="男性" />
                </td>
              </tr>
              <tr>
                <td class="text-3xl md:text-4xl whitespace-nowrap form-table-padding p-4 md:p-6 text-blue-800">住所</td>
                <td>
                  <input class="w-full md:w-96 h-12 border-2 md:border-4 border-blue-700 bg-gray-100 pl-4 text-3xl" type="text" placeholder="千葉県千葉市美浜区1-1" />
                </td>
              </tr>
            </table>
            <div class="text-center space-x-4 md:space-x-8 mt-14 mb-28">
              <input class="inline-block w-2/5 py-2 rounded-xl font-bold bg-yellow-300 text-4xl text-blue-800 cursor-pointer hover:bg-yellow-200 hover:text-blue-600 active:bg-red-200" type="button" value="登　録" @click.prevent="goToConfirm" />
              <input class="inline-block w-2/5 py-2 rounded-xl font-bold bg-yellow-300 text-4xl text-blue-800 cursor-pointer hover:bg-yellow-200 hover:text-blue-600 active:bg-red-200" type="button" value="戻　る" @click.prevent="back" />
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
    goToConfirm() {
      Router.push("/sign_up_confirm")
    },
    back() {
      Router.back();
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
