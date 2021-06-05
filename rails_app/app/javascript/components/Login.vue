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
            </h3>
          </div>
          <div>
            <h2 class="mt-10 text-3xl text-center text-blue-800 font-semibold">予約サービス ログインページ</h2>
          </div>
          <div>
            <form class="mt-10 ml-10">
              <table>
                <tbody>
                  <tr>
                    <th class="pr-3 pb-10 text-2xl text-blue-800 text-right border-none">ID</th>
                    <td class="border-none pb-10">
                      <input id="user_email" data-v-6fb8108a="" name="email" type="email" class="w-80 h-10 border-blue-800 border-2" autocomplete="email">
                    </td>
                  </tr>
                  <tr>
                    <th class="pr-3 text-2xl text-blue-800 text-right border-none">パスワード</th>
                    <td class="border-none">
                      <input id="user_pass" data-v-6fb8108a="" name="password" type="password" class="w-80 h-10 border-blue-800 border-2" autocomplete="on">
                    </td>
                  </tr>
                </tbody>
              </table>
              <div id="login_checkbox" class="mt-10 text-center">
                <input id="is_auto_login" class="w-20 border-blue-800 border-2" name="is_auto_login" type="checkbox">
                <label class="text-xl text-blue-800" for="is_auto_login">次からは自動でログインする</label><br>
              </div>
              <div class="mt-10 text-center">
                <input class="w-40 h-12 mr-8 p-1 text-2xl text-blue-800 bg-yellow-400" type="submit" :loading="loading" @click.prevent="submit" value="ログイン">
                <input class="w-40 h-12 p-1 text-2xl text-blue-800 bg-yellow-400" type="button" value="戻る">
              </div>
            </form>
            <div class="text-center mt-10 text-blue-800">
              <p class="mx-auto w-96 text-xl break-words text-left">アカウント未登録の方は下記から登録してください。</p>
              <input class="mt-4 w-80 h-12 p-1 text-2xl text-blue-800 bg-yellow-400" type="button" value="新規登録" @click.prevent="goToRegistration">
            </div>
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
import axios from 'axios'
import Router from "../router/router";
import Header from "./layout/Header.vue"
import Navigation from "./layout/Navigation.vue"
import Footer from "./layout/Footer.vue"

export default {
  data: function () {
    return {
      name:  '',
      loading: false,
      email: '',
      password: '',
    }
  },

  components: {
    Header,
    Navigation,
    Footer
  },

  methods: {
    // ログイン情報を送信する
    async submit() {
      this.email = document.getElementById("user_email").value
      this.password = document.getElementById("user_pass").value
      this.loading = true
      const params = {
        email: this.email,
        password: this.password,
      }
      await axios
        .post("/api/v1/auth/sign_in", params)
        .then(response => {
          localStorage.setItem("access-token", response.headers["access-token"]);
          localStorage.setItem("uid", response.headers["uid"]);
          localStorage.setItem("client", response.headers["client"]);

          Router.push("/");

          // TODO: Vuex でログイン状態を管理するようになったら消す
          window.location.reload();
        })
        .catch(e => {
          // TODO: 適切な Error 表示
          if (e.response) {
            console.log(e.response.data);
            console.log(e.response.status);
            console.log(e.response.headers);
          } else if (error.request) {
            console.log(e.request);
          } else {
            console.log('Error', e.message);
          }
        })
        .finally(() => {
          this.loading = false
        })
        console.log("hi")
    },
    goToRegistration() {
      Router.push("/sign_up");
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

/* ラベルのスタイル　*/
#login_checkbox label {
  padding-left: 38px; /* ラベルの位置 */
  line-height: 32px;
  display: inline-block;
  cursor: pointer;
  position: relative;
}

/* ボックスのスタイル */
#login_checkbox label:before {
  content: '';
  width: 32px; /* ボックスの横幅 */
  height: 32px; /* ボックスの縦幅 */
  display: inline-block;
  position: absolute;
  left: 0;
  background-color: #fff;
  border: 2px solid #1E40AF;
}
/* 元のチェックボックスを表示しない */
#login_checkbox input[type=checkbox] {
  display: none;
}
/* チェックした時のスタイル */
#login_checkbox input[type=checkbox]:checked + label:before {
  content: '\2713'; /* チェックの文字 */ 
  font-size: 24px; /* チェックのサイズ */
  color: #fff; /* チェックの色 */
  background-color: #06f; /* チェックした時の色 */
}
</style>
