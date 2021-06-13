<template>

</template>

<script>
import axios from 'axios'
import Router from "../router/router";

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

          Router.push("/")

          // TODO: Vuex でログイン状態を管理するようになったら消す
          window.location.reload()
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
</style>
