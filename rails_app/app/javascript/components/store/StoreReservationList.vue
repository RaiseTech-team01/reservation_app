<template>
  <div class="main m-0">
    <dir class="storeheader m-0 text-center">
      <StoreHeader />
    </dir>
    <div class="container-fluid mt-20">
      <div class="row flex justify-center">
        <main class="col-md-9">
          <h2>予約一覧画面</h2>
          <div class="table-responsive">
            <div class="col-12 alert alert-danger" v-show="hasError()">
              <p>{{ errorMessage }}</p>
            </div>
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
              <tbody>
                <tr v-for="item in reservationList" :key="item.id">
                  <td>{{ item.id }}</td>
                  <td>{{ item.date }}</td>
                  <td>{{ item.user }}</td>
                  <td>{{ item.startTime }}</td>
                  <td>{{ item.seatNum }}</td>
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
import StoreHeader from '../layout/StoreHeader.vue'
import axios from 'axios'

export default {
  data: function () {
    return {
      loading: false,
      errorMessage: '',
      reservationList: [],
      requestHeaders: {},
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
      event.target.classList.add('was-validated')
    },
    addData() {
      this.reservationList.push({
        id: 1100,
        date: '2021/07/01',
        user: '山田　太郎',
        startTime: '19:30',
        seatNum: 20,
      })
      this.reservationList.push({
        id: 1101,
        date: '2021/07/02',
        user: '川田　太郎',
        startTime: '20:00',
        seatNum: 5,
      })
      this.reservationList.push({
        id: 1103,
        date: '2021/07/03',
        user: '木村　太郎',
        startTime: '19:00',
        seatNum: 25,
      })
    },
    getDateString(reserveData) {
      // date_at: "2021-01-01T00:00:00.000+09:00"
      const date = reserveData.date_at
      const str = date.match(/^(2[0-9]+)-([01][0-9])-([0-3][0-9])/)
      return str[1] + '/' + str[2] + '/' + str[3]
    },
    getTimeString(reserveData) {
      // date_at: "2021-01-01T00:00:00.000+09:00"
      const date = reserveData.date_at
      const str = date.match(/T([0-2][0-9]):([0-5][0-9])/)
      return str[1] + ':' + str[2]
    },
    async requestRsrvData() {
      console.log('requestRsrvData')
      this.loading = true

      this.requestHeaders['access-token'] = 'fUt09hKBSccZ_Bw0dnPizQ'
      // this.requestHeaders['access-token'] = 'fUt09hKBSccZ_Bw0dnPizQasfsdfsd'
      this.requestHeaders['client'] = 'KyFzCkpSzX3mwsOkmVB3YA'
      // this.requestHeaders['uid'] = 'store1@sample.com'
      this.requestHeaders['uid'] = 'store1@sample.com'

      console.log(this.requestHeaders)

      await axios
        .get(
          '/api/v1/stores/reservations',
          { headers: this.requestHeaders },
          { data: {} }
        )
        .then((response) => {
          console.log('res', response)
          this.errorMessage = ''

          const reserveData = response.data.map((rsrv) => {
            return {
              id: rsrv.id,
              date: this.getDateString(rsrv),
              user: rsrv.user.name,
              startTime: this.getTimeString(rsrv),
              seatNum: rsrv.number_people,
            }
          })
          reserveData.forEach((item) => {
            this.reservationList.push(item)
          })

          // Vuex store
          // this.$store.dispatch('storeAuth/updateLogin', true)
          // this.$store.dispatch('registrationStoreUserData/updateErr', '')
          // console.log(response)
          // localStorage.setItem(
          //   'store-access-token',
          //   response.headers['access-token']
          // )
          // localStorage.setItem('store-uid', response.headers['uid'])
          // localStorage.setItem('store-client', response.headers['client'])
          // Router.push('/store_dash_board')
        })
        .catch((error) => {
          console.log('error')
          // console.log('err', error.response)
          // console.log('err', error.response.data.errors[0])
          this.errorMessage = error.response.data.errors[0]
          // console.log(error.response.status)
          // console.log(error.response.data.errors.full_messages)
          // this.$store.dispatch(
          //   'registrationStoreUserData/updateErr',
          //   error.response.data.errors.full_messages
          // )
          // Router.push('/store_account_form')
        })
        .finally(() => {
          this.loading = false
        })
    },
    initialize() {
      console.log('init')
      // this.addData()
      this.errorMessage = 'sample'
      this.requestRsrvData()
    },
  },
  mounted() {
    console.log('mounted')
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
