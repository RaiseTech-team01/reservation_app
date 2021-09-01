<template>
  <div class="main m-0">
    <dir class="header m-0 text-center pl-0">
      <Header :currentIndex="3" />
    </dir>
    <main>
      <div class="mt-5 py-5 text-center">
        <h2>ユーザ登録内容</h2>
      </div>
      <div class="row g-5 flex justify-center">
        <div class="col-md-7 col-lg-8">
          <form class="needs-validation" @submit="goToComplete" novalidate>
            <table class="table">
              <thead>
                <tr>
                  <th>種別</th>
                  <th>入力内容</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>名前</td>
                  <td>
                    {{ userData.name }}
                  </td>
                </tr>
                <tr>
                  <td>ふりがな</td>
                  <td>
                    {{ userData.furigana }}
                  </td>
                </tr>
                <tr>
                  <td>メールアドレス</td>
                  <td>
                    {{ userData.email }}
                  </td>
                </tr>
                <tr>
                  <td>電話番号</td>
                  <td>
                    {{ userData.tel }}
                  </td>
                </tr>
                <tr>
                  <td>性別</td>
                  <td>
                    {{ userData.gender }}
                  </td>
                </tr>
                <tr>
                  <td>生年月日</td>
                  <td>
                    {{ userData.birthday }}
                  </td>
                </tr>
                <tr>
                  <td>住所</td>
                  <td>
                    {{ userData.address }}
                  </td>
                </tr>
              </tbody>
            </table>
          </form>
        </div>
      </div>
      <div class="text-center mt-5">
        <button
          type="button"
          class="m-3 px-5 btn btn-lg btn-block text-white bg-rt-cyan"
          @click.prevent="goToAccountEdit"
        >
          編　集
        </button>
      </div>
    </main>
  </div>
</template>

<script>
import Router from "../router/router"
import Header from "./layout/Header.vue"
import Navigation from "./layout/Navigation.vue"
import Footer from "./layout/Footer.vue"
import BreadClumbList from "./commons/layouts/BreadClumbList.vue"
import { mapGetters } from "vuex"
import { getAge } from "../utils/utils"

export default {
  data: function () {
    return {
      breadClumbList: [
        {
          title: "トップ",
          href: "/home/top",
        },
        {
          title: "アカウント設定",
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
    getAgeStr(birthday) {
      return getAge(birthday)
    },
    goToAccountEdit() {
      Router.push("/api/v1/user/account_edit")
    },
  },

  computed: {
    ...mapGetters(["userData"]),
  },
}
</script>

<style scoped src="../../assets/stylesheets/bootstrap.min.css"></style>
<style scoped src="../../assets/stylesheets/customize.css"></style>
<style scoped>
p {
  font-size: 2em;
}
</style>
