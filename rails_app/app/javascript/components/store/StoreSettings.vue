<template>
  <div class="main m-0">
    <dir class="storeheader m-0 text-center">
      <StoreHeader />
    </dir>
    <div class="container">
      <main>
        <div class="mt-4 py-5 text-center">
          <h2>設定</h2>
        </div>
        <div class="row g-5 flex justify-center">
          <div class="col-12 alert alert-danger" v-show="hasError()">
            <p>{{ errorMessage }}</p>
          </div>
          <div class="col-md-7 col-lg-8">
            <form class="needs-validation" @submit="validate" novalidate>
              <div class="row g-3">
                <div class="col-12 card border-danger mb-3">
                  <h4 class="text-danger p-2">アカウント削除</h4>
                  <div class="text-center mb-5">
                    <button
                      type="button"
                      class="m-3 px-5 btn btn-danger btn-lg btn-block"
                      @click.prevent="deleteAccount"
                    >
                      アカウントを削除する
                    </button>
                  </div>
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
import axios from 'axios'

export default {
  data: function () {
    return {
      errorMessage: '111',
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
    async requestDeleteAccount() {
      // TODO 削除APIを利用する
      await axios
        .get(
          '/api/v1/stores/reservations',
          { headers: this.requestHeaders },
          { data: {} }
        )
        .then((response) => {
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
            this.addData(item)
          })
        })
        .catch((error) => {
          this.errorMessage = error.response.data.errors[0]
        })
        .finally(() => {
          this.loading = false
        })
    },
    deleteAccount() {
      if (!confirm('本当にアカウントを削除してよろしいですか？')) {
        return
      }
    },
  },
}
</script>

<style scoped src="../../../assets/stylesheets/bootstrap.min.css"></style>
<style scoped src="../../../assets/stylesheets/offcanvas.css"></style>
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
