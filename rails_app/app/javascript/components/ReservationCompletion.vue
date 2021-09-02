<template>
  <div class="main m-0">
    <dir class="header m-0 text-center pl-0">
      <Header />
    </dir>
    <div class="container mt-16">
      <main>
        <div class="mt-5 py-5 text-center">
          <h2>予約登録完了</h2>
        </div>
        <div class="row g-5 flex justify-center">
          <div class="col-5">
            <img
              src="/kanpai.png"
              class="rounded mx-auto d-block"
              alt="kanpai"
            />
            <p class="mt-3 fs-4">ご予約ありがとうございました！</p>
            <p class="fs-4 text-left">
              電話確認後に本予約となります。<br />近日中に担当者からご連絡させて頂きますので、お待ちください。
            </p>
          </div>
        </div>
        <div class="text-center">
          <button
            type="button"
            class="m-3 px-5 btn btn-lg btn-block text-white bg-rt-cyan"
            @click.prevent="goToList"
          >
            予約一覧へ移動
          </button>
        </div>
      </main>
    </div>
  </div>
</template>

<script>
import Router from "../router/router"
import Header from "./layout/Header.vue"
import Navigation from "./layout/Navigation.vue"
import Footer from "./layout/Footer.vue"
import BreadClumbList from "./commons/layouts/BreadClumbList.vue"

export default {
  data: function () {
    return {
      breadClumbList: [
        {
          title: "トップ",
          href: "/home/top",
        },
        {
          title: "予約登録完了",
        },
      ],
    }
  },

  components: {
    Header,
    Navigation,
    Footer,
    BreadClumbList,
  },

  methods: {
    goToList() {
      Router.push("/reservation_list")
    },
  },
}
</script>

<style scoped src="../../assets/stylesheets/bootstrap.min.css"></style>
<style scoped src="../../assets/stylesheets/customize.css"></style>
<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
