<template>
<div>
  <div id="timetable-bg" class="hidden absolute w-full h-full z-10  bg-black opacity-50"></div>
  <div id="timetable-dialog" class="hidden absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 z-10 border-2 border-black text-center p-8 bg-white">
    <div class="absolute right-4 top-2 text-blue-800 text-4xl cursor-pointer" @click="dismiss_timetable">
      <i class="fas fa-times "></i>
    </div>
    <p class="text-blue-800 text-xl font-bold text-center w-auto py-1">2021年3月</p>
    <p class="text-center text-blue-800 font-bold text-4xl py-2">
      <span class="inline-block text-5xl pr-2 align-middle"><i class="fas fa-caret-left"></i></span>
      <span class="align-middle">5日</span>
      <span class="inline-block text-5xl pl-2 align-middle"><i class="fas fa-caret-right"></i></span>
    </p>
    <div class="inline-block mt-4 bg-gray-100 px-2 pt-2 pb-5">
      <p class="relative w-96 text-2xl text-blue-800 font-bold py-2"><span class="absolute inline-block text-lg font-bold -top-1 z-10 bg-gray-100 p-2 left-0">16:45</span></p>
      <p class="relative w-96 text-2xl text-blue-800 font-bold border-t border-blue-800 py-2"><span class="absolute inline-block text-lg font-bold top-6 z-10 bg-gray-100 p-2 left-0">17:00</span>不可</p>
      <p class="relative w-96 text-2xl text-blue-800 font-bold border-t border-blue-800 py-2"><span class="absolute inline-block text-lg font-bold top-6 z-10 bg-gray-100 p-2 left-0">17:15</span>不可</p>
      <p class="relative w-96 text-2xl text-blue-800 font-bold border-t border-blue-800 py-2"><span class="absolute inline-block text-lg font-bold top-6 z-10 bg-gray-100 p-2 left-0">17:30</span>可</p>
      <p class="relative w-96 text-2xl text-blue-800 font-bold border-t border-blue-800 py-2"><span class="absolute inline-block text-lg font-bold top-6 z-10 bg-gray-100 p-2 left-0">17:45</span>可</p>
      <p class="relative w-96 text-2xl text-blue-800 font-bold border-t border-blue-800 py-2"><span class="absolute inline-block text-lg font-bold top-6 z-10 bg-gray-100 p-2 left-0">18:00</span>可</p>
      <p class="relative w-96 text-2xl text-blue-800 font-bold border-t border-blue-800 py-2"><span class="absolute inline-block text-lg font-bold top-6 z-10 bg-gray-100 p-2 left-0">18:15</span>可</p>
      <p class="relative w-96 text-2xl text-blue-800 font-bold border-t border-blue-800 py-2"><span class="absolute inline-block text-lg font-bold top-6 z-10 bg-gray-100 p-2 left-0">18:30</span>可</p>
      <p class="relative w-96 text-2xl text-blue-800 font-bold border-t border-b border-blue-800 py-2"><span class="absolute inline-block text-lg font-bold top-6 z-10 bg-gray-100 p-2 left-0">18:45</span>可</p>
    </div>
  </div>
</div>
</template>

<script>
export default {
  methods: {
    dismiss_timetable() {
      if ($("#timetable-dialog").is(':visible')) {
        $("#timetable-bg").hide()
        $("#timetable-dialog").hide("normal", function() {
          $('body, html').css({"overflow": "visible", "height": "auto"});
        });
      }
    }
  },
}
</script>

<style scoped>
</style>
