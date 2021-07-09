<template>
<div class="text-center">
  <main class="form-signin">
    <form>
      <div class="flex justify-center">
        <img class="mb-4 w-18 h-14" src="/logo.png" alt="">
      </div>
      <h1 class="h3 mb-3 fw-normal">管理画面ログイン</h1>

      <div v-show="hasError" class="my-4 pb-0 alert alert-danger" role="alert">
        <p>{{ errorMessage }}</p>
      </div>
      <div class="form-floating">
        <input type="email" class="form-control" id="user_email" placeholder="name@example.com">
        <label for="floatingInput">メールアドレス</label>
      </div>
      <div class="form-floating">
        <input type="password" class="form-control" id="user_pass" placeholder="Password">
        <label for="floatingPassword">パスワード</label>
      </div>

      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> ログイン情報を保存する
        </label>
      </div>
      <button class="w-100 btn btn-lg btn-primary" type="submit" @click.prevent="submit">ログイン</button>
      <button class="w-100 mt-4 btn btn-lg btn-info" type="submit" @click.prevent="goToRegistration">アカウントを登録</button>
      <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
    </form>
  </main>
</div>
</template>

<script>
import axios from 'axios'
import Router from "../../router/router";

export default {
  data: function () {
    return {
      name:  '',
      loading: false,
      email: '',
      password: '',
      hasError: false,
      errorMessage: "ログインに失敗しました。",
    }
  },

  components: {
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
        .post("/api/v1/store_auth/sign_in", params)
        .then(response => {
          localStorage.setItem("access-token", response.headers["access-token"])
          localStorage.setItem("uid", response.headers["uid"])
          localStorage.setItem("client", response.headers["client"])

          Router.push("/store_dash_board")

          // TODO: Vuex でログイン状態を管理するようになったら消す
          window.location.reload()
        })
        .catch(e => {
          // TODO: 適切な Error 表示
          if (e.response) {
            this.hasError = true;
            this.errorMessage = e.response.data.errors[0]

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
    },
    goToRegistration() {
      Router.push("/store_account_form")
    }
  }
}
</script>

<style scoped src="../../../assets/stylesheets/bootstrap.min.css"></style>
<style scoped>

/* --- start signin.css ---- */

html,
body {
  height: 100%;
}

body {
  display: flex;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}

.form-signin .checkbox {
  font-weight: 400;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

/* --- end signin.css ---- */

.bd-placeholder-img {
  font-size: 1.125rem;
  text-anchor: middle;
  -webkit-user-select: none;
  -moz-user-select: none;
  user-select: none;
}

@media (min-width: 768px) {
  .bd-placeholder-img-lg {
    font-size: 3.5rem;
  }
}
</style>
