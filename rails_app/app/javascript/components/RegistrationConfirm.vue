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
            <a class="font-bold hover:text-blue-500" href="index.html">新規登録確認</a>
          </h3>
        </div>
        <div class="mt-16">
          <div>
            <p class="text-center whitespace-nowrap flex justify-around md:justify-center md:space-x-12 md:transform md:scale-125 md:flex-none">
              <span class="arrow-block-inactive">入力</span>
              <span class="arrow-block">確認</span>
              <span class="arrow-block-inactive">登録</span>
            </p>
          </div>
        </div>
        <div>
          <h2 class="mt-16 mb-8 font-bold text-3xl md:text-4xl text-center text-blue-800">下記の情報を登録して良いですか？</h2>
          <form>
            <table class="m-2 mt-10 table-auto max-w-full md:w-full md:text-center">
              <tr class="h-24">
                <td class="block md:w-1/5 md:table-cell text-3xl md:text-4xl form-table-padding md:pl-6 text-blue-800">氏名</td>
                <td class="block md:table-cell space-x-4 pb-6 md:pb-0">
                  <div>
                    <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold">
                      田中　一郎
                    </p>
                  </div>
                </td>
              </tr>
              <tr class="h-24">
                <td class="block md:table-cell text-3xl md:text-4xl form-table-padding md:pl-6 text-blue-800">カナ</td>
                <td class="block md:table-cell pb-6 md:pb-0">
                  <div>
                    <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold">
                      タナカ　イチロウ
                    </p>
                  </div>
                </td>
              </tr>
              <tr class="h-24">
                <td class="block md:table-cell text-3xl form-table-padding md:pl-6 text-blue-800">メール<br class="hidden md:block">アドレス</td>
                <td class="block md:table-cell pb-6 md:pb-0">
                  <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold break-all">
                    Ichiro.Tanaka@smail.comIchiro.Tanaka@smail.comIchiro.Tanaka@smail.comIchiro.Tanaka@smail.com
                  </p>
                </td>
              </tr>
              <tr class="h-24">
                <td class="block md:table-cell text-3xl form-table-padding md:pl-6 text-blue-800">電話<br class="hidden md:block">番号</td>
                <td class="block md:table-cell pb-6 md:pb-0">
                  <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold">
                    080-1111-2222
                  </p>
                </td>
              </tr>
              <tr class="h-24">
                <td class="block md:table-cell text-3xl md:text-4xl form-table-padding md:pl-6 text-blue-800">年齢</td>
                <td class="block md:table-cell pb-6 md:pb-0">
                  <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold">
                    31 歳
                  </p>
                </td>
              </tr>
              <tr class="h-24">
                <td class="block md:table-cell text-3xl md:text-4xl form-table-padding md:pl-6 text-blue-800">性別</td>
                <td class="block md:table-cell pb-6 md:pb-0">
                  <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold">
                    男性
                  </p>
                </td>
              </tr>
              <tr class="h-24">
                <td class="block md:table-cell text-3xl md:text-4xl form-table-padding md:pl-6 text-blue-800">住所</td>
                <td class="block md:table-cell pb-6 md:pb-0">
                  <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold break-all">
                    千葉県千葉市美浜区1-1千葉県千葉市美浜区1-1千葉県千葉市美浜区1-1千葉県千葉市美浜区1-1
                  </p>
                </td>
              </tr>
            </table>
            <div class="text-center space-x-4 md:space-x-8 mt-14 mb-28">
              <input class="inline-block w-2/5 py-2 rounded-xl font-bold bg-yellow-300 text-4xl text-blue-800 cursor-pointer hover:bg-yellow-200 hover:text-blue-600 active:bg-red-200" type="button" value="登録完了" @click.prevent="goToComplete" />
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
    goToComplete() {
      Router.push("/sign_up_complete")
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
}
</style>
