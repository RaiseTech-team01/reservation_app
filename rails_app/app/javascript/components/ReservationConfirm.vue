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
            <a class="font-bold hover:text-blue-500" href="index.html">予約登録確認</a>
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
          <h2 class="mt-16 mb-8 font-bold text-3xl md:text-4xl text-center text-blue-800">ご予約内容は下記でよろしいですか？</h2>
          <form>
            <table class="m-2 mt-10 table-auto max-w-full md:w-full md:text-center">
              <tr class="h-24">
                <td class="block md:w-1/5 md:table-cell text-3xl md:text-4xl form-table-padding md:pl-6 text-blue-800">店舗</td>
                <td class="block md:table-cell space-x-4 pb-6 md:pb-0">
                  <div>
                    <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold">
                      イロハ駅前店
                    </p>
                  </div>
                </td>
              </tr>
              <tr class="h-24">
                <td class="block md:table-cell text-3xl md:text-4xl form-table-padding md:pl-6 text-blue-800">日付</td>
                <td class="block md:table-cell pb-6 md:pb-0">
                  <div>
                    <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold">
                      2021年3月21日
                    </p>
                  </div>
                </td>
              </tr>
              <tr class="h-24">
                <td class="block md:table-cell text-3xl form-table-padding md:pl-6 text-blue-800">時間帯</td>
                <td class="block md:table-cell pb-6 md:pb-0">
                  <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold break-all">
                    18時00分～
                  </p>
                </td>
              </tr>
              <tr class="h-24">
                <td class="block md:table-cell text-3xl form-table-padding md:pl-6 text-blue-800 whitespace-nowrap">ご利用人数</td>
                <td class="block md:table-cell pb-6 md:pb-0">
                  <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold">
                    5名様
                  </p>
                </td>
              </tr>
              <tr class="h-24">
                <td class="block md:table-cell text-3xl form-table-padding md:pl-6 text-blue-800">ご予算</td>
                <td class="block md:table-cell pb-6 md:pb-0">
                  <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold">
                    3,000円
                  </p>
                </td>
              </tr>
              <tr class="h-24">
                <td class="block md:table-cell text-3xl form-table-padding md:pl-6 text-blue-800">個人情報<br class="hidden md:block">保護方針</td>
                <td class="block md:table-cell pb-6 md:pb-0">
                  <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold">
                    同意する
                  </p>
                </td>
              </tr>
            </table>
            <div class="text-center space-x-4 md:space-x-8 mt-14 mb-28">
              <input class="inline-block w-2/5 py-2 rounded-xl font-bold bg-yellow-300 text-4xl text-blue-800 cursor-pointer hover:bg-yellow-200 hover:text-blue-600 active:bg-red-200" type="button" value="送　信" @click.prevent="goToComplete" />
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
      Router.push("/reservation_complete")
    },
    back() {
      Router.back()
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
}
</style>
