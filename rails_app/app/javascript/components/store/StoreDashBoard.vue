<template>
  <div class="main m-0">
    <dir class="storeheader m-0 text-center">
      <StoreHeader />
    </dir>
    <div class="container-fruid mt-20">
      <main>
        <div class="py-5 text-center">
          <h2>DashBoard</h2>
        </div>
        <div>
          <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold">
            {{ storeUserData.name }}
          </p>
        </div>
        <div class="row g-5 flex justify-center">
          <div class="col-md-7 col-lg-8">
            <form class="needs-validation" @submit="validate" novalidate>
              <div class="row g-3">
                <div class="col-12 mb-3">
                  <h2>直近の予約</h2>
                  <table class="table table-striped table-sm">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>日付</th>
                        <th>予約者名</th>
                        <th>時間帯</th>
                        <th>予約人数</th>
                      </tr>
                    </thead>
                    <tbody v-if="reservationList.length != 0">
                      <tr v-for="rsrv in reservationList" :key="rsrv.id">
                        <td>{{ rsrv.id }}</td>
                        <td>{{ rsrv.date }}</td>
                        <td>{{ rsrv.name }}</td>
                        <td>{{ rsrv.startTime }}</td>
                        <td>{{ rsrv.seatNum }}</td>
                      </tr>
                    </tbody>
                    <tbody v-else>
                      <tr>
                        データが存在しません
                      </tr>
                    </tbody>
                  </table>
                </div>
                <div class="col-12 mb-3">
                  <h2>新規登録ユーザ</h2>
                  <table class="table table-striped table-sm">
                    <thead>
                      <tr>
                        <th>#</th>
                        <th>ユーザ名</th>
                        <th>年齢</th>
                        <th>性別</th>
                        <th>住所</th>
                      </tr>
                    </thead>
                    <tbody v-if="userList.length != 0">
                      <tr v-for="user in userList" :key="user.id">
                        <td>{{ user.id }}</td>
                        <td>{{ user.name }}</td>
                        <td>{{ user.age }}</td>
                        <td>{{ user.gendar }}</td>
                        <td>{{ user.address }}</td>
                      </tr>
                    </tbody>
                    <tbody v-else>
                      <tr>
                        データが存在しません
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </form>
          </div>
        </div>
      </main>

      <footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2017–2021 Company Name</p>
        <ul class="list-inline">
          <li class="list-inline-item"><a href="#">Privacy</a></li>
          <li class="list-inline-item"><a href="#">Terms</a></li>
          <li class="list-inline-item"><a href="#">Support</a></li>
        </ul>
      </footer>
    </div>
  </div>
</template>

<script>
import StoreHeader from "../layout/StoreHeader.vue"
import { mapGetters } from "vuex"
import axios from "axios"

export default {
  data: function () {
    return {
      userList: [],
      reservationList: [],
      errorMessage: "",
    }
  },

  components: {
    StoreHeader,
  },

  methods: {
    hasError() {
      return !!this.errorMessage
    },
    validate(event) {
      if (!event.target.checkValidity()) {
        event.preventDefault()
        event.stopPropagation()
      }
      event.target.classList.add("was-validated")
    },
    makeHeaders(accessToken, client, uid) {
      let headers = {}
      headers["access-token"] = accessToken
      headers["client"] = client
      headers["uid"] = uid
      return headers
    },
    getDateString(reserveData) {
      // date_at: "2021-01-01T00:00:00.000+09:00"
      const date = reserveData.date_at
      const str = date.match(/^(2[0-9]+)-([01][0-9])-([0-3][0-9])/)
      return str[1] + "/" + str[2] + "/" + str[3]
    },
    getTimeString(reserveData) {
      // date_at: "2021-01-01T00:00:00.000+09:00"
      const date = reserveData.date_at
      const str = date.match(/T([0-2][0-9]):([0-5][0-9])/)
      return str[1] + ":" + str[2]
    },
    addUser(user) {
      this.userList.push(user)
    },
    addReservation(rsrv) {
      this.reservationList.push(rsrv)
    },
    async requestUserList() {
      console.log("requestUserList")
    },
    async requestReservationList() {
      this.loading = true

      const accessToken = localStorage.getItem("store-access-token")
      const client = localStorage.getItem("store-client")
      const uid = localStorage.getItem("store-uid")
      if (!(accessToken && client && uid)) {
        this.errorMessage =
          "正常なログイン情報が格納されていません。再ログインしてください。"
        return
      }
      this.requestHeaders = this.makeHeaders(accessToken, client, uid)

      await axios
        .get(
          "/api/v1/stores/reservations",
          { headers: this.requestHeaders },
          { data: {} }
        )
        .then((response) => {
          this.errorMessage = ""
          const reserveData = response.data.map((rsrv) => {
            return {
              id: rsrv.id,
              date: this.getDateString(rsrv),
              name: rsrv.user.name,
              startTime: this.getTimeString(rsrv),
              seatNum: rsrv.number_people,
            }
          })
          if (reserveData) {
            if (reserveData.length !== 0) {
              reserveData.forEach((rsrv) => {
                this.addReservation(rsrv)
              })
            } else {
              console.log("サーバにデータがありません")
            }
          } else {
            this.addReservation({
              id: 0,
              date: "2021/07/31",
              name: "田中 一郎",
              startTime: "18:30",
              seatNum: 10,
            })
            this.addReservation({
              id: 1,
              date: "2021/08/01",
              name: "山本 次郎",
              startTime: "19:00",
              seatNum: 21,
            })
          }
        })
        .catch((error) => {
          this.errorMessage = error.response.data.errors[0]
        })
        .finally(() => {
          this.loading = false
        })
    },
    initialize() {
      const userList = this.requestUserList()

      this.addUser({
        id: 0,
        name: "ユーザ110",
        age: 20,
        gendar: "男性",
        address: "宮城県登米市海江町三社1-1-1",
      })
      this.addUser({
        id: 1,
        name: "ユーザ120",
        age: 25,
        gendar: "女性",
        address: "山梨県甲府市上条1-2-3",
      })

      this.requestReservationList()
    },
  },
  mounted() {
    this.initialize()
  },
  computed: {
    ...mapGetters(["storeUserData"]),
  },
}
</script>

<style scoped src="../../../assets/stylesheets/bootstrap.min.css"></style>
<style scoped src="../../../assets/stylesheets/dashboard.css"></style>
<style scoped>
p {
  font-size: 1em;
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
