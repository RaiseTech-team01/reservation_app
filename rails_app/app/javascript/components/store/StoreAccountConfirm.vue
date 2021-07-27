<template>
<div class="main m-0">
  <dir class="storeheader m-0 text-center">
    <StoreHeader />
  </dir>
  <div class="container">
    <main>
      <div class="mt-10 py-5 text-center">
        <h2>店舗アカウント登録確認</h2>
        <p class="lead">お客様の店舗用のアカウントを登録いたします。<br>内容の確認をお願いいたします。</p>
      </div>

      <div class="row g-5 flex justify-center">
        <div class="col-md-7 col-lg-8">
          <div class="col-12 alert alert-danger" v-show="hasError">
            <p>{{errorMessage}}</p>
          </div>
          <form class="needs-validation" @submit="validate" novalidate>
            <div class="row g-3">
              <div class="col-12">
                <h4>名前</h4>
                <p class="">{{registrationStoreUserData.name}}</p>
              </div>
              <div class="col-12">
                <h4>ふりがな</h4>
                <p class="">{{registrationStoreUserData.furigana}}</p>
              </div>
              <div class="col-12">
                <h4>メールアドレス</h4>
                <p class="">{{registrationStoreUserData.email}}</p>
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
                <p class="">{{registrationStoreUserData.tel}}</p>
              </div>
              <div class="col-12">
                <h4>FAX番号</h4>
                <p class="">{{registrationStoreUserData.fax}}</p>
              </div>
              <div class="col-12">
                <h4>郵便番号</h4>
                <p class="">{{registrationStoreUserData.postal_code}}</p>
              </div>
              <div class="col-12">
                <h4>店舗住所</h4>
                <p class="">{{registrationStoreUserData.address}}</p>
              </div>
              <div class="col-12">
                <h4>店舗URL</h4>
                <p class="">{{registrationStoreUserData.url}}</p>
              </div>
              <div class="col-12">
                <h4>店舗名</h4>
                <p class="">{{registrationStoreUserData.restaurant}}</p>
              </div>
              <div class="col-12">
                <h4>座席数</h4>
                <p class="">{{registrationStoreUserData.seat}}</p>
              </div>
              <div class="col-12">
                <h4>業態</h4>
                <p class="">{{registrationStoreUserData.genre}}</p>
              </div>
              <div class="col-12">
                <h4>責任者名</h4>
                <p class="">{{registrationStoreUserData.responsible_party}}</p>
              </div>
              <div class="col-12">
                <h4>その他</h4>
                <p class="">{{registrationStoreUserData.other}}</p>
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
import Router from "../../router/router";
import StoreHeader from "../layout/StoreHeader.vue"
import { mapGetters } from 'vuex'
import axios from "axios";

export default {
  data: function () {
    return {
      storeData: [],
      hasError: false,
      errorMessage: "",
    }
  },

  components: {
    StoreHeader,
  },

  methods: {
        // 店舗情報を送信する
        async submit() {
            this.loading = true;
            await axios
                .post("/api/v1/store_auth/", this.storeData)
                .then(response => {

                    // Vuex store
                    this.$store.dispatch('storeAuth/updateLogin', true)

                    Router.push("/store_account_confirm");
                })
                .catch(e => {
                    if (e.response) {
                        this.hasError = true;
                        this.errorMessage = e.response.data.errors.full_messages[0];

                        this.showErrorMessage(e)

                        console.log(e.response.data);
                        console.log(e.response.status);
                        console.log(e.response.headers);
                    } else {
                        console.log("Error", e.message);
                    }
                })
                .finally(() => {
                    this.loading = false;
                });
        },
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
  },
  computed: {
    ...mapGetters([
      'registrationStoreUserData',
    ])
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
