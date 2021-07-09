<template>
  <header>
    <div
      class="w-screen flex justify-center justify-items-center h-16 bg-black"
    >
      <h3
        class="relative text-yellow-300 text-base md:text-2xl p-4 font-mono"
      >
        Reservation App
      </h3>
      <div v-if="isLogin === true">
        <i
          @click="$data.isOpenMenu1 = !$data.isOpenMenu1"
          class="far fa-user-circle absolute top-4 right-20 text-yellow-300 hover:text-yellow-200 text-4xl text-center cursor-pointer"
        ></i>
        <transition name="fade">
          <p
            v-if="$data.isOpenMenu1"
            @click="signout"
            v-on:mouseout="$data.isOpenMenu1 = false"
            class="absolute top-16 right-10 w-28 text-center p-2 bg-gray-100 hover:bg-gray-200 border shadow-md text-blue-800 cursor-pointer"
          >
            ログアウト
          </p>
        </transition>
      </div>
      <div v-else>
        <i
          @click="$data.isOpenMenu2 = !$data.isOpenMenu2"
          class="far fa-user-circle absolute top-4 right-20 text-gray-300 hover:text-gray-200 text-4xl text-center cursor-pointer"
        ></i>
        <transition name="fade">
          <p
            v-if="$data.isOpenMenu2"
            @click="signin"
            v-on:mouseout="$data.isOpenMenu2 = false"
            class="absolute top-16 right-10 w-28 text-center p-2 bg-gray-100 hover:bg-gray-200 border shadow-md text-blue-800 cursor-pointer"
          >
            ログイン
          </p>
        </transition>
      </div>
      <div id="sp_toggle" class="md:hidden" @click="toggle_navigation">
        <i
          id="hamburger-btn"
          class="fas fa-bars absolute top-4 right-4 text-yellow-300 hover:text-yellow-200 text-4xl text-center cursor-pointer"
        ></i>
        <!-- xボタンのhiddenを有効にするためspanを追加 -->
        <span id="cross-btn" class="hidden"
          ><i
            class="fas fa-times absolute top-4 right-4 text-yellow-300 hover:text-yellow-200 text-4xl text-center cursor-pointer"
          ></i
        ></span>
      </div>
    </div>
    <ul v-if="isLogin === true"  class="absolute w-screen hidden overflow-hidden sp_menu_toggle h-screen bg-gray-300">
      <li class="text-2xl text-blue-800 font-bold p-6 border-blue-800 active:bg-gray-200 active:text-blue-600 border-b-2" @click="goToReservationForm">予約入力</li>
      <li class="text-2xl text-blue-800 font-bold p-6 border-blue-800 active:bg-gray-200 active:text-blue-600 border-b-2"><a href="/reservation_list">予約一覧</a></li>
      <li class="text-2xl text-blue-800 font-bold p-6 border-blue-800 active:bg-gray-200 active:text-blue-600 border-b-2"><a href="/reservation_view_history">閲覧履歴</a></li>
      <li class="text-2xl text-blue-800 font-bold p-6 border-blue-800 active:bg-gray-200 active:text-blue-600 border-b-2"><a href="/reservation_history">予約履歴</a></li>
      <li class="text-2xl text-blue-800 font-bold p-6 border-blue-800 active:bg-gray-200 active:text-blue-600 border-b-2"><a href="/settings">アカウント設定</a></li>
    </ul>
    <img
      class="md:block mx-auto bg-gray-400 h-48"
      src="/banner.png"
      alt="banner"
    />
  </header>
</template>

<script>
import Router from "../../router/router";
import axios from 'axios';

export default {
  data: function () {
    return {
      isOpenMenu1: false,
      isOpenMenu2: false,
    }
  },
  // storeの価が変わると、computedが実行される
  computed: {
    isLogin() {
      // TODO ログイン状態を真偽値で返す
       return this.$store.getters.auth.isLogin;
    },
  },

  methods: {
    toggle_navigation() {
      $(".sp_menu_toggle").slideToggle("normal", function() {
        if ($(".sp_menu_toggle").is(':visible')) {
          $('#hamburger-btn').hide()
          $('#cross-btn').show()
          $('body, html').css({"overflow": "hidden", "height": "100%"});
        } else {
          $('#hamburger-btn').show()
          $('#cross-btn').hide()
          $('body, html').css({"overflow": "visible", "height": "auto"});
        }
      })
    },

    signin() {
      // TODO ログイン処理
      Router.push("/login")

    },

    async signout() {
      // TODO ログアウト処理
      // DELETE http://localhost:3000/api/v1/auth/sign_out

      var key_headers = {
        headers : {
          "Accept":"application/json",
          "access-token":localStorage.getItem('access-token'),
          "uid":localStorage.getItem('uid'),
          "client":localStorage.getItem('client')
        }
      }

      // rail logout api
      await axios
          .delete("/api/v1/auth/sign_out", key_headers )
          .then(function (response) {
            console.log(response);
          })
          .catch(function (error) {
            // console.log(error);
            return false;
          })
          .finally(function () {
            // always executed
          });

      localStorage.removeItem("access-token")
      localStorage.removeItem("uid")
      localStorage.removeItem("client")
      this.$store.dispatch('auth/updateLogin', false)

      Router.push("/login")

    },
    // isLogin() は、computedへ移動
    
    goToReservationForm() {
      Router.push("/reservation_form")
    },
    goToReservationList() {
      Router.push("/reservation_list")
    },
    goToReservationViewHistory() {
      Router.push("/reservation_view_history")
    },
    goToReservationHistory() {
      Router.push("/reservation_history")
    },
    goToAccountSettings() {
      Router.push("/account_info")
    },
  },
}
</script>

<style scoped>
.sp_menu_toggle {
  display: none;
}
</style>

