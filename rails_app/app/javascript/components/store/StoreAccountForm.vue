<template>
<div class="main m-0">
  <dir class="storeheader m-0 text-center">
    <StoreHeader />
  </dir>
  <div class="container">
    <main>
      <div class="py-5 text-center">
        <h2>店舗アカウント登録</h2>
        <p class="lead">お客様の店舗用のアカウントを作成いたします。<br>情報の登録をお願いいたします。</p>
      </div>

      <div class="row g-5">
        <div class="col-md-7 col-lg-8">
          <h4 class="mb-3">Billing address</h4>
          <form class="needs-validation" @submit="validate" novalidate>
            <div class="row g-3">
              <div class="col-sm-6">
                <label for="firstName" class="form-label">店舗名</label>
                <input type="text" class="form-control" id="storeName" placeholder="いろは駅前店" value="" required>
                <div class="invalid-feedback">
                  必須
                </div>
              </div>

              <div class="col-sm-6">
                <label for="lastName" class="form-label">代表者名</label>
                <input type="text" class="form-control" id="representativePerson" placeholder="田中 一郎" value="" required>
                <div class="invalid-feedback">
                  必須
                </div>
              </div>

              <div class="col-12">
                <label for="email" class="form-label">メールアドレス <span class="text-muted">必須</span></label>
                <input type="email" class="form-control" id="email" placeholder="you@example.com">
                <div class="invalid-feedback">
                  有効なメールアドレスを記載してください。
                </div>
              </div>

              <div class="col-12">
                <label for="address" class="form-label">店舗住所</label>
                <input type="text" class="form-control" id="address" placeholder="東京都台東区駒形1-1" required>
                <div class="invalid-feedback">
                  店舗の所在地を記載してください。
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
import StoreHeader from "../layout/StoreHeader.vue"
import '../../css/bootstrap.min.css'
import '../../css/bootstrap/offcanvas.css'

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
    }
  }
}
</script>

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
