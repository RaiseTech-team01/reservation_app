<template>
<!-- モバイル用ヘッダー -->
<nav class="navbar navbar-expand-lg fixed-top navbar-dark bg-dark" aria-label="Main navigation">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">店舗管理</a>
    <button @click="toggleHamburger" class="navbar-toggler p-0 border-0" type="button" id="navbarSideCollapse" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="navbar-collapse offcanvas-collapse" id="navbarsExampleDefault">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">ダッシュボード</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">予約一覧画面</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">ユーザ一覧画面</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">設定</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
</template>

<script>
import '../../css/bootstrap.min.css'
import '../../css/bootstrap/offcanvas.css'

export default {
  data: function () {
    return {

    }
  },
  methods: {
    toggleHamburger() {
      document.querySelector('.offcanvas-collapse').classList.toggle('open')
    }
  },
}

</script>

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
