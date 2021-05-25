<template>
<div class="main m-0">
  <dir class="header m-0 text-center">
    <Header />
  </dir>
  <main class="mt-28">
    <!-- min-widthを設定する -->
    <dir class="navigation m-0">
      <Navigation />
    </dir>
    <div class="flex justify-center">
      <div class="bg-gray-300 pb-16" style="width: 766px">
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
            <p>
              <span class="arrow-block mr-12">入力</span>
              <span class="arrow-block">確認</span>
              <span class="arrow-block ml-12">登録</span>
            </p>
          </div>
        </div>
        <div>
          <p class="mt-16 mb-8 font-bold text-4xl text-blue-800">お客様の情報を入力してください</p>
          <form>
            <table class="m-10 table-auto">
              <tr>
                <td class="text-4xl form-table-padding p-6 text-blue-800">氏名</td>
                <td>
                  <input class="w-44 h-12 mr-4 border-4 border-blue-700 bg-gray-100 text-center text-3xl" type="text" />
                  <input class="w-44 h-12 ml-4 border-4 border-blue-700 bg-gray-100 text-center text-3xl" type="text" />
                </td>
              </tr>
              <tr>
                <td class="text-4xl form-table-padding p-6 text-blue-800">カナ</td>
                <td>
                  <input class="w-44 h-12 mr-4 border-4 border-blue-700 bg-gray-100 text-center text-3xl" type="text" />
                  <input class="w-44 h-12 ml-4 border-4 border-blue-700 bg-gray-100 text-center text-3xl" type="text" />
                </td>
              </tr>
              <tr>
                <td class="text-3xl form-table-padding p-6 text-blue-800">メールアドレス</td>
                <td>
                  <input class="w-96 h-12 border-4 border-blue-700 bg-gray-100 text-center text-3xl" type="email" />
                </td>
              </tr>
              <tr>
                <td class="text-4xl form-table-padding p-6 text-blue-800">電話番号</td>
                <td>
                  <input class="w-96 h-12 border-4 border-blue-700 bg-gray-100 text-center text-3xl" type="tel" />
                </td>
              </tr>
              <tr>
                <td class="text-4xl form-table-padding p-6 text-blue-800">年齢</td>
                <td>
                  <input class="w-44 h-12 border-4 border-blue-700 bg-gray-100 text-center text-3xl" type="text" />
                </td>
              </tr>
              <tr>
                <td class="text-4xl form-table-padding p-6 text-blue-800">性別</td>
                <td>
                  <input class="w-44 h-12 border-4 border-blue-700 bg-gray-100 text-center text-3xl" type="text" />
                </td>
              </tr>
              <tr>
                <td class="text-4xl form-table-padding p-6 text-blue-800">住所</td>
                <td>
                  <input class="w-96 h-12 border-4 border-blue-700 bg-gray-100 text-center text-3xl" type="text" />
                </td>
              </tr>
            </table>
            <div class="text-center space-x-8 mt-14">
              <input class="inline-block px-16 py-2 rounded-xl font-bold bg-yellow-300 text-4xl text-blue-800 cursor-pointer hover:bg-yellow-200 hover:text-blue-600" type="button" value="登　録" />
              <input class="inline-block px-16 py-2 rounded-xl font-bold bg-yellow-300 text-4xl text-blue-800 cursor-pointer hover:bg-yellow-200 hover:text-blue-600" type="button" value="戻　る" />
            </div>
          </form>
        </div>
      </div>
    </div>
    <dir class="footer">
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
</style>
