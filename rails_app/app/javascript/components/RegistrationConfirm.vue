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
            <a class="font-bold hover:text-blue-500" href="index.html">ログイン</a>
            <span> > </span>
            <a class="font-bold hover:text-blue-500" href="index.html">新規登録確認</a>
          </h3>
        </div>
        <div class="mt-16">
          <div>
            <p class="whitespace-nowrap flex justify-around md:justify-center md:space-x-12 md:transform md:scale-125 md:flex-none">
              <span class="arrow-block-inactive">入力</span>
              <span class="arrow-block">確認</span>
              <span class="arrow-block-inactive">登録</span>
            </p>
          </div>
        </div>
        <div>
          <h2 class="mt-16 mb-8 font-bold text-3xl md:text-4xl text-center text-blue-800">下記の情報を登録して良いですか？</h2>
          <form>
            <table class="m-2 md:m-10 table-auto max-w-full">
              <tr class="h-24">
                <td class="text-3xl mg:text-4xl whitespace-nowrap form-table-padding pl-4 md:pl-6 text-blue-800">氏名</td>
                <td class="space-x-4">
                  <div>
                    <p class="w-full md:w-96 md:mr-4 pl-4 text-3xl text-blue-800 font-bold">
                      田中　一郎
                    </p>
                  </div>
                </td>
              </tr>
              <tr class="h-24">
                <td class="text-3xl mg:text-4xl whitespace-nowrap form-table-padding pl-4 md:pl-6 text-blue-800">カナ</td>
                <td>
                  <div>
                    <p class="w-full md:w-96 md:mr-4 pl-4 text-3xl text-blue-800 font-bold">
                      タナカ　イチロウ
                    </p>
                  </div>
                </td>
              </tr>
              <tr class="h-24">
                <td class="text-2xl md:text-3xl whitespace-nowrap form-table-padding pl-4 md:pl-6 text-blue-800">メール<br class="md:hidden" />アドレス</td>
                <td>
                  <p class="w-full md:w-96 md:mr-4 pl-4 text-3xl text-blue-800 font-bold white break-all">
                    あああ
                  </p>
                </td>
              </tr>
              <tr class="h-24">
                <td class="text-2xl md:text-4xl whitespace-nowrap form-table-padding pl-4 md:pl-6 text-blue-800">電話<br class="md:hidden" />番号</td>
                <td>
                  <p class="w-full md:w-96 md:mr-4 pl-4 text-3xl text-blue-800 font-bold">
                    080-1111-2222
                  </p>
                </td>
              </tr>
              <tr class="h-24">
                <td class="text-3xl md:text-4xl whitespace-nowrap form-table-padding pl-4 md:pl-6 text-blue-800">年齢</td>
                <td>
                  <p class="w-full md:w-96 md:mr-4 pl-4 text-3xl text-blue-800 font-bold">
                    31 歳
                  </p>
                </td>
              </tr>
              <tr class="h-24">
                <td class="text-3xl md:text-4xl whitespace-nowrap form-table-padding pl-4 md:pl-6 text-blue-800">性別</td>
                <td>
                  <p class="w-full md:w-96 md:mr-4 pl-4 text-3xl text-blue-800 font-bold">
                    男性
                  </p>
                </td>
              </tr>
              <tr class="h-24">
                <td class="text-3xl md:text-4xl whitespace-nowrap form-table-padding pl-4 md:pl-6 text-blue-800">住所</td>
                <td>
                  <p class="w-full md:w-96 md:mr-4 pl-4 text-3xl text-blue-800 font-bold">
                    千葉県千葉市美浜区1-1
                  </p>
                </td>
              </tr>
            </table>
            <div class="text-center space-x-4 md:space-x-8 mt-14 mb-28">
              <input class="inline-block px-10 md:px-16 py-2 rounded-xl font-bold bg-yellow-300 text-4xl text-blue-800 cursor-pointer hover:bg-yellow-200 hover:text-blue-600 active:bg-red-200" type="button" value="登録完了" />
              <input class="inline-block px-10 md:px-16 py-2 rounded-xl font-bold bg-yellow-300 text-4xl text-blue-800 cursor-pointer hover:bg-yellow-200 hover:text-blue-600 active:bg-red-200" type="button" value="戻　る" />
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
</style>
