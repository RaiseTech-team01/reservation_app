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
        <div class="row g-5 flex justify-center">
          <div class="col-md-7 col-lg-8">
            <form class="needs-validation" @submit="validate" novalidate>
              <div class="row g-3">
                <div class="col-12 mb-3">
                  <h2>直近の予約数</h2>
                  <table class="table table-striped table-sm">
                    <thead>
                      <tr>
                        <th>日付</th>
                        <th>曜日</th>
                        <th>予約組数</th>
                        <th>予約人数</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="rsrv in reservationList" :key="rsrv.id">
                        <td>{{ rsrv.date }}</td>
                        <td>{{ rsrv.day }}</td>
                        <td>{{ rsrv.groupNum }}</td>
                        <td>{{ rsrv.seatNum }}</td>
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
                    <tbody>
                      <tr v-for="user in userList" :key="user.id">
                        <td>{{ user.id }}</td>
                        <td>{{ user.name }}</td>
                        <td>{{ user.age }}</td>
                        <td>{{ user.gendar }}</td>
                        <td>{{ user.address }}</td>
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
import StoreHeader from '../layout/StoreHeader.vue'

export default {
  data: function () {
    return {
      userList: [],
      reservationList: [],
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
      event.target.classList.add('was-validated')
    },
    addUser(user) {
      this.userList.push(user)
    },
    addReservation(rsrv) {
      this.reservationList.push(rsrv)
    },
    initialize() {
      this.addUser({
        id: 0,
        name: 'ユーザ110',
        age: 20,
        gendar: '男性',
        address: '宮城県登米市海江町三社1-1-1',
      })
      this.addUser({
        id: 1,
        name: 'ユーザ120',
        age: 25,
        gendar: '女性',
        address: '山梨県甲府市上条1-2-3',
      })
      this.addReservation({
        id: 0,
        date: '2021/07/31',
        day: '木',
        groupNum: 10,
        seatNum: 55,
      })
      this.addReservation({
        id: 1,
        date: '2021/08/11',
        day: '月',
        groupNum: 20,
        seatNum: 35,
      })
    },
  },
  mounted() {
    this.initialize()
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
