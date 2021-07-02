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

      <div class="row g-5 flex justify-center">
        <div class="col-md-7 col-lg-8">
          <form class="needs-validation" @submit="validate" novalidate>
            <div class="row g-3">
              <div class="col-12">
                <label for="firstName" class="form-label">名前 <span class="text-muted">必須</span></label>
                <input type="text" class="form-control" id="storeName" placeholder="居酒屋 太平洋" value="" required>
              </div>
              <div class="col-12">
                <label for="firstName" class="form-label">ふりがな</label>
                <input type="text" class="form-control" id="storeName" placeholder="いざかや たいへいよう" value="" required>
              </div>
              <div class="col-12">
                <label for="email" class="form-label">メールアドレス <span class="text-muted">必須</span></label>
                <input type="email" class="form-control" id="email" placeholder="you@example.com">
                <div class="invalid-feedback">
                  有効なメールアドレスを記載してください。
                </div>
              </div>
              <div class="col-12">
                <label for="password" class="form-label">パスワード <span class="text-muted">必須</span></label>
                <input type="password" class="form-control" id="password" placeholder="080-1111-222">
                <div class="invalid-feedback">
                  電話番号を記載してください。
                </div>
              </div>
              <div class="col-12">
                <label for="password-confirm" class="form-label">パスワード（確認） <span class="text-muted">必須</span></label>
                <input type="password" class="form-control" id="password-confirm" placeholder="080-1111-222">
                <div class="invalid-feedback">
                  電話番号を記載してください。
                </div>
              </div>
              <div class="col-12">
                <label for="tel" class="form-label">電話番号 <span class="text-muted">必須</span></label>
                <input type="tel" class="form-control" id="tel" placeholder="080-1111-222">
                <div class="invalid-feedback">
                  電話番号を記載してください。
                </div>
              </div>
              <div class="col-12">
                <label for="fax" class="form-label">FAX番号</label>
                <input type="tel" class="form-control" id="fax" placeholder="03-4444-5555">
                <div class="invalid-feedback">
                  FAX番号を記載してください。
                </div>
              </div>
              <div class="col-12">
                <label for="postal-code" class="form-label">郵便番号 <span class="text-muted">必須</span></label>
                <input type="number" class="form-control" id="postal-code" placeholder="111-0043">
                <div class="invalid-feedback">
                  郵便番号を記載してください。
                </div>
              </div>
              <div class="col-12">
                <label for="address" class="form-label">店舗住所 <span class="text-muted">必須</span></label>
                <input type="text" class="form-control" id="address" placeholder="東京都台東区駒形1-1" required>
                <div class="invalid-feedback">
                  店舗の所在地を記載してください。
                </div>
              </div>
              <div class="col-12">
                <label for="store-url" class="form-label">店舗URL</label>
                <input type="url" class="form-control" id="store-url" placeholder="http://izakaya.com/iroha" value="" required>
                <div class="invalid-feedback">
                  店舗のURLを記載してください。
                </div>
              </div>
              <div class="col-12">
                <label for="store-name" class="form-label">店舗名 <span class="text-muted">必須</span></label>
                <input type="text" class="form-control" id="store-name" placeholder="いろは駅前店" value="" required>
                <div class="invalid-feedback">
                  店舗名を記載してください。
                </div>
              </div>
              <div class="col-12">
                <label for="sear-num" class="form-label">座席数 <span class="text-muted">必須</span></label>
                <input type="number" class="form-control" id="sear-num" placeholder="100" value="" required>
                <div class="invalid-feedback">
                  座席数を記載してください。
                </div>
              </div>
              <div class="col-12">
                <label for="genre" class="form-label">業態 <span class="text-muted">必須</span></label>
                <input type="text" class="form-control" id="genre" placeholder="飲食業" value="" required>
                <div class="invalid-feedback">
                  業態を記載してください。
                </div>
              </div>
              <div class="col-12">
                <label for="responsible-party" class="form-label">責任者名 <span class="text-muted">必須</span></label>
                <input type="text" class="form-control" id="responsible-party" placeholder="担当者A" value="" required>
                <div class="invalid-feedback">
                  業態を記載してください。
                </div>
              </div>
              <div class="col-12">
                <label for="others" class="form-label">その他</label>
                <input type="text" class="form-control" id="others" placeholder="アレルギー品目：大豆、牛乳、小麦粉" value="" required>
                <div class="invalid-feedback">
                  追記する情報がありましたら記載してください。
                </div>
              </div>
            </div>
          </form>
        </div>
      </div>
      <div class="text-center">
        <button type="button" class="m-3 px-5 btn btn-primary btn-lg btn-block" @click.prevent="goToAccountConfirm">登録確認</button>
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
    goToAccountConfirm() {
      Router.push("/store_account_confirm")
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
