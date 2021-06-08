<template>
  <header>
    <div class="w-screen flex justify-center justify-items-center h-16 bg-black">
      <h3 class="relative text-yellow-300 text-base md:text-2xl p-4 font-mono">Reservation App</h3>
      <div @click="signout">
        <i class="far fa-user-circle absolute top-4 right-20 text-yellow-300 hover:text-yellow-200 text-4xl text-center cursor-pointer"></i>
      </div>
      <div id="sp_toggle" class="md:hidden" @click="toggle_navigation">
        <i id="hamburger-btn" class="fas fa-bars absolute top-4 right-4 text-yellow-300 hover:text-yellow-200 text-4xl text-center cursor-pointer"></i>
        <!-- xボタンのhiddenを有効にするためspanを追加 -->
        <span id="cross-btn" class="hidden"><i class="fas fa-times absolute top-4 right-4 text-yellow-300 hover:text-yellow-200 text-4xl text-center cursor-pointer"></i></span>
      </div>
    </div>
    <ul class="absolute w-screen hidden overflow-hidden sp_menu_toggle h-screen bg-gray-300">
      <li class="text-2xl text-blue-800 font-bold p-6 border-blue-800 active:bg-gray-200 active:text-blue-600 border-b-2"><a href="">予約入力</a></li>
      <li class="text-2xl text-blue-800 font-bold p-6 border-blue-800 active:bg-gray-200 active:text-blue-600 border-b-2"><a href="">予約一覧</a></li>
      <li class="text-2xl text-blue-800 font-bold p-6 border-blue-800 active:bg-gray-200 active:text-blue-600 border-b-2"><a href="">閲覧履歴</a></li>
      <li class="text-2xl text-blue-800 font-bold p-6 border-blue-800 active:bg-gray-200 active:text-blue-600 border-b-2"><a href="">予約履歴</a></li>
      <li class="text-2xl text-blue-800 font-bold p-6 border-blue-800 active:bg-gray-200 active:text-blue-600 border-b-2"><a href="">アカウント設定</a></li>
    </ul>
    <img class="hidden md:block mx-auto" src="/banner.png" alt="banner">
  </header>
</template>

<script>
export default {
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
    signout() {
      // ここにログアウト用の処理を入れる..
    },
  },
}
</script>

<style scoped>
.sp_menu_toggle {
  display: none;
}
</style>
