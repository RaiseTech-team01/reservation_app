<template>
  <div class="main m-0">
    <dir class="storeheader m-0 text-center">
      <StoreHeader />
    </dir>
    <div class="container-fluid mt-20">
      <div class="row flex justify-center">
        <main class="col-md-9">
          <h2>ユーザ一覧画面</h2>
          <div class="table-responsive">
            <table class="table table-striped table-sm">
              <thead>
                <tr>
                  <th>#</th>
                  <th>ユーザ名</th>
                  <th>メールアドレス</th>
                  <th>年齢</th>
                  <th>性別</th>
                  <th>電話番号</th>
                </tr>
              </thead>
              <tbody>
                <tr v-for="user in userList" :key="user.id">
                  <td>{{ user.id }}</td>
                  <td>{{ user.name }}</td>
                  <td>{{ user.email }}</td>
                  <td>{{ user.age }}</td>
                  <td>{{ user.gendar }}</td>
                  <td>{{ user.tel }}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </main>
      </div>
    </div>
  </div>
</template>

<script>
import StoreHeader from "../layout/StoreHeader.vue"
import axios from "axios"

export default {
  data: function () {
    return {
      userList: [],
    }
  },

  components: {
    StoreHeader,
  },

  methods: {
    validate(event) {
      if (!event.target.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
      event.target.classList.add("was-validated")
    },
    initialize() {
      console.log("init")
    },
    addData(data) {
      this.userList.push(data)
    },
    async submit(successCallback) {
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
          // TODO ユーザ一覧データを取得するためのAPIを叩き、取得したデータをuserListに設定する

          successCallback()
          // localStorage.setItem("access-token", response.headers["access-token"])
          // localStorage.setItem("uid", response.headers["uid"])
          // localStorage.setItem("client", response.headers["client"])

          // // console.log(response.data.data)
          // this.loginedUserData = response.data.data
          // console.log(this.loginedUserData)

          // // Vuex store
          // this.$store.dispatch('userData/update', this.loginedUserData)
          // this.$store.dispatch('auth/updateLogin', true)
          // Router.push("/api/v1/user/account_info")
        })
        .catch((error) => {
          // TODO エラー情報をアラートとして画面に表示する
          // TODO: 適切な Error 表示
          // console.log(error.response),
          // console.log(error.response.data.errors),
          // this.$store.dispatch('userData/updateErr', error.response.data.errors)
          // Router.push("/login")
        })
        .finally(() => {
          this.loading = false
        })
      console.log("axios finished")
    },
  },
  mounted: function () {
    // submit(() => {
    //   this.initialize();
    // })
    this.addData({
      id: "1",
      name: "木村雄二",
      email: "user1@sample.com",
      age: 25,
      gendar: "男性",
      tel: "08034566543",
    })
    this.addData({
      id: "2",
      name: "田中紀子",
      email: "user2@sample.com",
      age: 30,
      gendar: "女性",
      tel: "08098761234",
    })
    this.addData({
      id: "3",
      name: "村上庄司",
      email: "user3@sample.com",
      age: 20,
      gendar: "男性",
      tel: "08098761234",
    })
  },
}
</script>

<style scoped src="../../../assets/stylesheets/bootstrap.min.css"></style>
<style scoped src="../../../assets/stylesheets/dashboard.css"></style>
<style scoped>
p {
  font-size: 2em;
  text-align: center;
}

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
