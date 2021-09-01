<template>
  <div class="main m-0">
    <dir class="header m-0 pl-0 text-center">
      <Header />
    </dir>
    <main class="mt-32">
      <div class="text-center">
        <main class="form-signin">
          <form class="needs-validation" novalidate>
            <h1 class="h1 mb-5 fw-normal text-nowrap">ようこそ！</h1>

            <div
              v-show="hasError()"
              class="my-4 pb-0 alert alert-danger"
              role="alert"
            >
              <p>{{ errorMessage }}</p>
            </div>
            <div class="form-floating">
              <input
                type="email"
                class="form-control was-validated"
                id="user_email"
                v-model="typedEmail"
                placeholder="name@example.com"
                required
              />
              <label for="floatingInput">メールアドレス</label>
              <div class="invalid-feedback">
                メールアドレスをご記載ください。
              </div>
            </div>
            <div class="form-floating mb-3">
              <input
                type="password"
                class="form-control was-validated"
                id="user_pass"
                v-model="typedPassword"
                placeholder="Password"
                minlength="6"
                required
              />
              <label for="floatingPassword">パスワード</label>
              <div class="invalid-feedback">
                パスワード（6文字以上）をご入力ください。
              </div>
            </div>

            <div class="checkbox mb-4 text-rt-cyan">
              <label>
                <input type="checkbox" value="remember-me" />
                ログイン情報を保存する
              </label>
            </div>
            <button
              class="w-100 btn btn-lg text-white bg-rt-cyan"
              type="submit"
              :loading="loading"
            >
              ログイン
            </button>
            <button
              class="w-100 mt-4 btn btn-lg text-rt-indigo bg-rt-lightgreen"
              type="submit"
              @click.prevent="goToRegistration"
            >
              アカウントを登録
            </button>
            <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
          </form>
        </main>
      </div>
    </main>
  </div>
</template>

<script>
import axios from "axios"
import Router from "../router/router"
import Header from "./layout/Header.vue"
import Navigation from "./layout/Navigation.vue"
import Footer from "./layout/Footer.vue"
import BreadClumbList from "./commons/layouts/BreadClumbList.vue"

export default {
  data: function () {
    return {
      errorMessage: "",
      typedEmail: "",
      typedPassword: "",
      loginedUserData: {
        address: "",
        allow_password_change: "",
        birthday: "",
        email: "",
        furigana: "",
        gender: "",
        id: "",
        image: "",
        name: "",
        provider: "",
        tel: "",
        uid: "",
      },
      breadClumbList: [
        {
          title: "トップ",
          href: "/home/top",
        },
        {
          title: "ログイン",
        },
      ],
    }
  },

  components: {
    Header,
    Navigation,
    Footer,
    BreadClumbList,
  },

  methods: {
    // ログイン情報を送信する
    async submit() {
      this.typedEmail = document.getElementById("user_email").value
      this.typedPassword = document.getElementById("user_pass").value
      this.loading = true
      const params = {
        email: `${this.typedEmail}`,
        password: `${this.typedPassword}`,
      }
      await axios
        .post("/api/v1/auth/sign_in", params)
        .then((response) => {
          localStorage.setItem("access-token", response.headers["access-token"])
          localStorage.setItem("uid", response.headers["uid"])
          localStorage.setItem("client", response.headers["client"])

          // console.log(response.data.data)
          this.loginedUserData = response.data.data
          console.log(this.loginedUserData)

          // Vuex store
          this.$store.dispatch("userData/update", this.loginedUserData)
          this.$store.dispatch("auth/updateLogin", true)
          Router.push("/api/v1/user/account_info")
        })
        .catch((error) => {
          // TODO: 適切な Error 表示
          console.log(error.response)
          console.log(error.response.data.errors)
          this.errorMessage = error.response.data.errors[0]
          this.$store.dispatch("userData/updateErr", error.response.data.errors)
        })
        .finally(() => {
          this.loading = false
        })
      console.log("axios finished")
    },
    goToRegistration() {
      Router.push("/sign_up")
    },
    back() {
      Router.back()
    },
    hasError() {
      return !!this.errorMessage
    },
    initializeValidation(validatedCallback) {
      const instance0 = this
      this.$nextTick(function () {
        console.log(this)
        const instance = this
        //("use strict");

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.querySelectorAll(".needs-validation")

        // Loop over them and prevent submission
        Array.prototype.slice.call(forms).forEach(function (form) {
          form.addEventListener(
            "submit",
            function (event) {
              console.log("# 100")
              if (!form.checkValidity()) {
                console.log("invalid")
                event.preventDefault()
                event.stopPropagation()
              } else {
                console.log("valid")
                console.log("instance:")
                console.log(instance)
                console.log("instance0:")
                console.log(instance0)
                event.preventDefault()
                event.stopPropagation()
                console.log(this)

                validatedCallback()
              }
              form.classList.add("was-validated")
            },
            false
          )
        })
      })
    },
  },
  mounted() {
    this.initializeValidation(() => {
      console.log("success validation")
      this.submit()
    })
  },
}
</script>

<style scoped src="../../assets/stylesheets/bootstrap.min.css"></style>
<style scoped src="../../assets/stylesheets/customize.css"></style>
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
