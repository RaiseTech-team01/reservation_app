<template>
<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark" aria-label="Main navigation">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">店舗管理</a>
    <button @click="toggleHamburger" class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <span class="nav-link active" aria-current="page" @click="goToDashBoard">ダッシュボード</span>
        </li>
        <li class="nav-item">
          <span class="nav-link" @click="goToReservationList">予約一覧画面</span>
        </li>
        <li class="nav-item">
          <span class="nav-link" @click="goToUserList">ユーザ一覧画面</span>
        </li>
        <li class="nav-item">
          <span class="nav-link" @click="goToSettings">設定</span>
        </li>
      </ul>
    </div>
  </div>
</nav>
</template>

<script>
import Router from "../../router/router"

export default {
  data: function () {
    return {

    }
  },
  methods: {
    toggleHamburger() {
      document.querySelector('.offcanvas-collapse').classList.toggle('open')
    },
    goToDashBoard() {
      Router.push("/store_dash_board")
    },
    goToReservationList() {
      Router.push("/store_reservation_list")
    },
    goToUserList() {
      Router.push("/store_user_list")
    },
    goToSettings() {
      Router.push("/store_settings")
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
</style>
