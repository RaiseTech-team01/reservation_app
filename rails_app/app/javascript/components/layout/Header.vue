<template>
  <nav
    class="navbar navbar-expand-lg fixed-top navbar-dark bg-rt-indigo"
    aria-label="Main navigation"
  >
    <div class="container-fluid">
      <div class="w-44 navbar-brand">
        <a href="#"
          ><img src="/header-logo.png" class="float-start" alt="header logo"
        /></a>
      </div>
      <button
        @click="toggleHamburger"
        class="navbar-toggler p-0 border-0"
        type="button"
        id="navbarSideCollapse"
        aria-label="Toggle navigation"
      >
        <span class="navbar-toggler-icon" />
      </button>

      <div
        class="navbar-collapse offcanvas-collapse"
        id="navbarsExampleDefault"
      >
        <ul
          class="navbar-nav me-auto mb-2 ml-5 mb-lg-0 space-x-8 cursor-pointer"
          v-if="isLogin === true"
        >
          <template v-for="(nav, index) in navList">
            <li
              v-if="index === currentIndex"
              class="nav-link active fs-6"
              @click="nav.callback"
              :key="index"
            >
              <i :class="nav.icon" />　{{ nav.title }}
            </li>
            <li v-else :key="index" class="nav-link fs-6" @click="nav.callback">
              <i :class="nav.icon" />　{{ nav.title }}
            </li>
          </template>
        </ul>
        <p v-else class="text-white fs-5 p-0 m-0 title">予約受付サービス</p>
      </div>
    </div>
  </nav>
</template>

<script>
import Router from "../../router/router"

export default {
  data: function () {
    return {
      navList: [
        {
          title: "予約する",
          icon: "fas fa-user-plus",
          callback: this.goToReservationForm,
        },
        {
          title: "予約中",
          icon: "fas fa-user-check",
          callback: this.goToReservationList,
        },
        {
          title: "利用履歴",
          icon: "fas fa-book-reader",
          callback: this.goToReservationHistory,
        },
        {
          title: "ユーザ設定",
          icon: "fas fa-user-cog",
          callback: this.goToAccountSettings,
        },
      ],
    }
  },
  props: {
    currentIndex: Number,
  },
  methods: {
    toggleHamburger() {
      document.querySelector(".offcanvas-collapse").classList.toggle("open")
    },
    goToReservationForm() {
      Router.push("/reservation_form")
    },
    goToReservationList() {
      Router.push("/reservation_list")
    },
    goToReservationHistory() {
      Router.push("/api/v1/user/reservation_history")
    },
    goToAccountSettings() {
      Router.push("/api/v1/user/account_info")
    },
  },
  computed: {
    isLogin() {
      // TODO ログイン状態を真偽値で返す
      return this.$store.getters.auth.isLogin
    },
  },
}
</script>

<style scoped src="../../../assets/stylesheets/bootstrap.min.css"></style>
<style scoped src="../../../assets/stylesheets/offcanvas.css"></style>
<style scoped>
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

.bg-rt-indigo {
  background-color: rgb(19, 29, 50) !important;
}

.title {
  letter-spacing: 0.2rem;
}
</style>
