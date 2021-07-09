<template>
<div class="main m-0">
  <dir class="storeheader m-0 text-center">
    <StoreHeader />
  </dir>
  <div class="container">
    <main>
      <div class="py-5 text-center">
        <h2>店舗アカウント登録確認</h2>
        <p class="lead">お客様の店舗用のアカウントを登録いたします。<br>内容の確認をお願いいたします。</p>
      </div>

      <div class="row g-5 flex justify-center">
        <div class="col-md-7 col-lg-8">
          <form class="needs-validation" @submit="validate" novalidate>
            <div class="row g-3">
              <div class="col-12">
                <h4>名前</h4>
                <p class="">居酒屋 太平洋</p>
              </div>
              <div class="col-12">
                <h4>ふりがな</h4>
                <p class="">いざかや たいへいよう</p>
              </div>
              <div class="col-12">
                <h4>メールアドレス</h4>
                <p class="">you@example.com</p>
              </div>
              <div class="col-12">
                <h4>パスワード</h4>
                <p class="">********</p>
              </div>
              <div class="col-12">
                <h4>パスワード（確認）</h4>
                <p class="">********</p>
              </div>
              <div class="col-12">
                <h4>電話番号</h4>
                <p class="">080-1111-2222</p>
              </div>
              <div class="col-12">
                <h4>FAX番号</h4>
                <p class="">03-4444-5555</p>
              </div>
              <div class="col-12">
                <h4>郵便番号</h4>
                <p class="">111-0043</p>
              </div>
              <div class="col-12">
                <h4>店舗住所</h4>
                <p class="">東京都台東区駒形1-1</p>
              </div>
              <div class="col-12">
                <h4>店舗URL</h4>
                <p class="">http://izakaya.com/iroha</p>
              </div>
              <div class="col-12">
                <h4>店舗名</h4>
                <p class="">いろは駅前店</p>
              </div>
              <div class="col-12">
                <h4>座席数</h4>
                <p class="">100</p>
              </div>
              <div class="col-12">
                <h4>業態</h4>
                <p class="">飲食業</p>
              </div>
              <div class="col-12">
                <h4>責任者名</h4>
                <p class="">担当者A</p>
              </div>
              <div class="col-12">
                <h4>その他</h4>
                <p class="">アレルギー品目：大豆、牛乳、小麦粉</p>
              </div>
            </div>
          </form>
        </div>
      </div>
      <div class="text-center">
        <button type="button" class="m-3 px-5 btn btn-primary btn-lg btn-block" @click.prevent="goToDashBoard">登　録</button>
        <button type="button" class="m-3 px-5 btn btn-outline-primary btn-lg btn-block" @click.prevent="back">戻　る</button>
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

export default {
  data: function () {
    return {
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
    goToDashBoard() {
      Router.push("/store_dash_board")
    },
    back() {
      Router.back()
    }
  }
}
</script>

<style scoped src="../../../assets/stylesheets/bootstrap.min.css"></style>
<style scoped src="../../../assets/stylesheets/offcanvas.css"></style>
<style scoped>
p {
  font-size: 1.5em;
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
