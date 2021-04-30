<template>
  <div class="main">
    <header class="h-16 bg-black">
      <img class="h-44" src="/banner.png" alt="banner">
    </header>
    <main class="mt-28"><!-- min-widthを設定する -->
      <div class="h-16 text-center flex flex-row justify-center items-center">
        <!-- 文字を縦の中心に -->
        <span class="flex flex-col justify-center w-1/6 mr-1 h-16 text-2xl bg-red-500 text-white">予約入力</span>
        <span class="flex flex-col justify-center w-1/6 mr-1 h-16 text-2xl bg-red-500 text-white">予約一覧</span>
        <span class="flex flex-col justify-center w-1/6 mr-1 h-16 text-2xl bg-red-500 text-white">閲覧履歴</span>
        <span class="flex flex-col justify-center w-1/6 mr-1 h-16 text-2xl bg-red-500 text-white">予約履歴</span>
        <span class="flex flex-col justify-center w-1/6 mr-1 h-16 text-xl font-bold bg-red-500 text-white">アカウント設定</span>
      </div>

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
              <div>
                <label class="text-2xl text-blue-800 mr-3" for="email">ID</label>
                <input class="w-80 h-10 border-blue-800 border-2" name="email" type="text"><br>
              </div>
              <div class="mt-10">
                <label class="text-2xl text-blue-800 mr-3" for="password">パスワード</label>
                <input class="w-56 h-10 border-blue-800 border-2" name="password" type="password"><br>
              </div>
              <div id="login_checkbox" class="mt-10">
                <input id="is_auto_login" class="w-20 border-blue-800 border-2" name="is_auto_login" type="checkbox">
                <label class="text-xl text-blue-800" for="is_auto_login">次からは自動でログインする</label><br>
              </div>
              <div class="mt-10 text-center">
                <input class="w-40 h-12 mr-8 p-1 text-2xl text-blue-800 bg-yellow-400" type="submit" :loading="loading" @click="submit" value="ログイン">
                <input class="w-40 h-12 p-1 text-2xl text-blue-800 bg-yellow-400" type="button" value="戻る">
              </div>
          </form>
          <div class="text-center mt-10 text-blue-800">
            <p class="mx-auto w-96 text-xl break-words text-left">アカウント未登録の方は下記から登録してください。</p>
            <input class="mt-4 w-80 h-12 p-1 text-2xl text-blue-800 bg-yellow-400" type="button" value="新規登録">
          </div>
          </div>
        </div>
      </div>
    </main>
    <footer class="flex flex-col justify-center h-16 bg-black">
      <p class="text-center text-white">@WebDev01.corp</p>
    </footer>
  </div>
</template>

<script>
import axios from 'axios'
import Router from "./router/router";

export default {
  data: function () {
    return {
      name:  '',
      loading: false,
      email: '',
      password: '',
    }
  },

  methods: {
    async submit() {
      this.loading = true
      const params = {
        email: this.email,
        password: this.password,
      }
      await axios
        .post("/api/v1/users/auth/sign_in", params)
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
          alert(e.response.data.errors.full_messages);
        })
        .finally(() => {
          this.loading = false
        })
        console.log("hi")
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
