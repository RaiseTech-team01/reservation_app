<template>
  <div class="h-16 text-center flex flex-row justify-center">
    <span class="flex flex-col justify-center w-1/6 mr-1 h-16 text-2xl bg-red-500 hover:bg-red-700 active:bg-yellow-700 text-white cursor-pointer" @click="goToRegistrationForm">予約入力</span>
    <span class="flex flex-col justify-center w-1/6 mr-1 h-16 text-2xl bg-red-500 hover:bg-red-700 active:bg-yellow-700 text-white cursor-pointer" @click="goToRegistrationList">予約一覧</span>
    <span class="flex flex-col justify-center w-1/6 mr-1 h-16 text-2xl bg-red-500 hover:bg-red-700 active:bg-yellow-700 text-white cursor-pointer" @click="goToRegistrationViewHistory">閲覧履歴</span>
    <span class="flex flex-col justify-center w-1/6 mr-1 h-16 text-2xl bg-red-500 hover:bg-red-700 active:bg-yellow-700 text-white cursor-pointer" @click="goToRegistrationHistory">予約履歴</span>
    <span class="flex flex-col justify-center w-1/6 mr-1 h-16 text-2xl bg-red-500 hover:bg-red-700 active:bg-yellow-700 text-white font-bold cursor-pointer" @click="goToSettings">アカウント設定</span>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
    }
  },
  methods: {
    goToRegistrationForm() {
      Router.push("/registration_form")
    },
    goToRegistrationList() {
      Router.push("/registration_list")
    },
    goToRegistrationViewHistory() {
      Router.push("/registration_view_history")
    },
    goToRegistrationHistory() {
      Router.push("/registration_history")
    },
    goToSettings() {
      Router.push("/settings")
    },
  },
}
</script>
