<template>
  <div class="main m-0">
    <dir class="header m-0 text-center">
      <Header/>
    </dir>
    <main class="mt-28"><!-- min-widthを設定する -->
      <dir class="navigation m-0">
        <Navigation/>
      </dir>
      <div class="flex justify-center h-screen">
        <div class="bg-gray-300" style="width: 500px">
          <div>
            <h3 class="mt-4 ml-4 text-xl text-blue-800">
              <a class="font-bold" href="index.html">トップ</a>
              <span> > </span>
              <a class="font-bold" href="index.html">ログイン</a>
              <span> > </span>
              <a class="font-bold" href="index.html">新規登録入力</a>
            </h3>
          </div>
          <div>
            <div>
              <p>
                <span>入力</span>
                <span>確認</span>
                <span>登録</span>
              </p>
            </div>
          </div>
          <div>
            <p>お客様の情報を入力してください</p>
            <form>
            <table>
              <tr>
                <td>ご要望のID</td>
                <td><input type="text"></td>
              </tr>
              <tr>
                <td>氏名</td>
                <td><input type="text"></td>
              </tr>
              <tr>
                <td>カナ</td>
                <td><input type="text"></td>
              </tr>
              <tr>
                <td>年齢</td>
                <td><input type="text"></td>
              </tr>
              <tr>
                <td>性別</td>
                <td><input type="text"></td>
              </tr>
              <tr>
                <td>住所</td>
                <td><input type="text"></td>
              </tr>
              <tr>
                <td>メールアドレス</td>
                <td><input type="email"></td>
              </tr>
              <tr>
                <td>電話番号</td>
                <td><input type="tel"></td>
              </tr>
            </table>
            <div>
              <input type="button" value="登　録">
              <input type="button" value="戻　る">
            </div>
            </form>
          </div>
        </div>
      </div>
      <dir class="footer">
        <Footer/>
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
