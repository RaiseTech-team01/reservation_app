<template>
<div class="main m-0">
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
            <a class="font-bold hover:text-blue-500" href="index.html">予約登録完了</a>
          </h3>
        </div>
        <div class="mt-16">
          <div>
            <p class="whitespace-nowrap flex justify-around md:justify-center md:space-x-12 md:transform md:scale-125 md:flex-none">
              <span class="arrow-block-inactive">入力</span>
              <span class="arrow-block-inactive">確認</span>
              <span class="arrow-block">登録</span>
            </p>
          </div>
        </div>
        <div>
          <h2 class="mt-16 mb-8 font-bold text-3xl md:text-4xl text-center text-blue-800">ご予約を完了いたしました。</h2>
          <p class="text-center md:space-x-10 space-x-3">
            <span class="mt-16 mb-8 font-bold text-2xl md:text-3xl text-center text-blue-800">予約番号</span>
            <span class="mt-16 mb-8 font-bold text-2xl md:text-3xl text-center text-blue-800">TNX001122</span>
          </p>
          <form>
            <div class="text-center space-x-4 md:space-x-8 mt-14 pb-28">
              <input class="inline-block w-3/5 py-2 rounded-xl font-bold bg-yellow-300 md:text-4xl text-3xl text-blue-800 cursor-pointer hover:bg-yellow-200 hover:text-blue-600 active:bg-red-200" type="button" value="トップへ" @click.prevent="goToTop" />
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
    goToTop() {
      Router.push("/account_info")
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
