<template>
  <div class="main m-0">
    <dir class="header m-0 pl-0 text-center">
      <Header/>
    </dir>
    <main>
      <!-- min-widthを設定する -->
      <dir class="navigation m-0 pl-0 hidden md:block">
        <Navigation/>
      </dir>
      <div class="flex justify-center">
        <div class="bg-gray-300 info-container">
          <div>
            <h3 class="mt-10 ml-4 text-xl text-blue-800">
              <a class="font-bold hover:text-blue-500" href="index.html"
                >トップ</a
              >
              <span> > </span>
              <a class="font-bold hover:text-blue-500" href="index.html"
                >ログイン</a
              >
            </h3>
          </div>
          <div>
            <h2
              class="mt-16 mb-8 font-bold text-3xl md:text-4xl text-center text-blue-800"
            >
              予約サービス ログインページ
            </h2>
          </div>
          <div>
            <form class="mt-10">
              <div class="flex justify-center">
                <table>
                  <tbody>
                    <tr>
                      <th
                        class="block text-3xl text-blue-800 p-2"
                      >
                        ID
                      </th>
                      <td class="border-none pb-10">
                        <input
                          id="user_email"
                          data-v-6fb8108a=""
                          name="email"
                          type="email"
                          class="text-2xl md:text-3xl whitespace-nowrap form-table-padding p-1 md:p-2 text-blue-800"
                          autocomplete="email"
                          placeholder="tanaka@sample.com"
                        />
                      </td>
                    </tr>
                    <tr>
                      <th
                        class="pr-3 text-2xl text-blue-800 text-right border-none"
                      >
                        パスワード
                      </th>
                      <td class="border-none">
                        <input
                          id="user_pass"
                          data-v-6fb8108a=""
                          name="password"
                          type="password"
                          class="text-2xl md:text-3xl whitespace-nowrap form-table-padding p-1 md:p-2 text-blue-800"
                          autocomplete="on"
                        />
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div id="login_checkbox" class="mt-10 text-center">
                <input
                  id="is_auto_login"
                  class="radiox inline-block mr-4 align-middle transform scale-150"
                  name="is_auto_login"
                  type="checkbox"
                />
                <label
                  class="my-4 text-2xl md:text-3xl font-bold align-middle text-blue-800 hover:text-blue-600"
                  for="is_auto_login"
                  >次からは自動でログインする</label
                ><br />
              </div>
              <div class="text-center space-x-4 md:space-x-8 my-14">
                <input
                  class="inline-block w-2/5 py-2 rounded-xl font-bold bg-yellow-300 text-4xl text-blue-800 cursor-pointer hover:bg-yellow-200 hover:text-blue-600 active:bg-red-200"
                  type="submit"
                  :loading="loading"
                  @click.prevent="submit"
                  value="ログイン"
                />
                <input
                  class="inline-block w-2/5 py-2 rounded-xl font-bold bg-yellow-300 text-4xl text-blue-800 cursor-pointer hover:bg-yellow-200 hover:text-blue-600 active:bg-red-200"
                  type="button"
                  value="戻る"
                />
              </div>
            </form>
            <div class="text-center mt-10 text-blue-800 mb-28">
              <p
                class="my-4 px-4 text-2xl leading-relaxed align-middle text-blue-800"
              >
                アカウント未登録の方は下記から登録してください。
              </p>
              <input
                class="inline-block w-1/2 py-2 my-4 rounded-xl font-bold bg-yellow-200 text-4xl text-blue-800 cursor-pointer hover:bg-yellow-100 hover:text-blue-600 active:bg-red-200"
                type="button"
                value="新規登録"
                @click.prevent="goToRegistration"
              />
            </div>
          </div>
        </div>
      </div>
    </main>
    <dir class="footer m-0 p-0">
      <Footer/>
    </dir>
  </div>
</template>

<script>
import axios from 'axios'
import Router from "../router/router"
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

          localStorage.setItem("access-token", response.headers["access-token"])
          localStorage.setItem("uid", response.headers["uid"])
          localStorage.setItem("client", response.headers["client"])

          // Router.push("/")

        // Vuex store

          this.$store.dispatch('userData/update', response.data.data)
          this.$store.dispatch('auth/updateLogin', true)

          //  画面遷移先を変更
          Router.push("/account_info")

          // TODO: Vuex でログイン状態を管理するようになったら消す
            //  window.location.reload()

        })
        .catch(e => {
          // TODO: 適切な Error 表示
          if (e.response) {
            console.log(e.response.data)
            console.log(e.response.status)
            console.log(e.response.headers)
          } else if (error.request) {
            console.log(e.request)
          } else {
            console.log('Error', e.message)
          }
        })
        .finally(() => {
          this.loading = false
        })
        console.log("hi")
    },
    goToRegistration() {
      Router.push("/sign_up")
    }
  }
}
</script>

<style scoped>

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

