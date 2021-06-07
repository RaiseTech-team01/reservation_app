<template>
<div>
  <div id="calendar-bg" class="hidden absolute w-full h-full z-10  bg-black opacity-50"></div>
  <div id="calendar-dialog" class="hidden absolute top-1/2 left-1/2 transform -translate-x-1/2 -translate-y-1/2 z-10 border-2 border-black text-center p-8 bg-white">
    <div class="absolute right-4 top-2 text-blue-800 text-4xl cursor-pointer" @click="dismiss_calendar">
      <i class="fas fa-times "></i>
    </div>
    <p class="text-blue-800 text-xl font-bold text-center w-auto py-1">2021年</p>
    <p class="text-center text-blue-800 font-bold text-4xl py-2">
      <span class="inline-block text-5xl pr-2 align-middle"><i class="fas fa-caret-left"></i></span>
      <span class="align-middle">3月</span>
      <span class="inline-block text-5xl pl-2 align-middle"><i class="fas fa-caret-right"></i></span>
    </p>
    <table class="text-center inline-block mt-4">
      <tr>
        <td class="text-red-600 text-xl font-bold p-3">Su</td>
        <td class="text-blue-800 text-xl font-bold p-3">Mo</td>
        <td class="text-blue-800 text-xl font-bold p-3">Tu</td>
        <td class="text-blue-800 text-xl font-bold p-3">We</td>
        <td class="text-blue-800 text-xl font-bold p-3">Th</td>
        <td class="text-blue-800 text-xl font-bold p-3">Fr</td>
        <td class="text-blue-800 text-xl font-bold p-3">Sa</td>
      </tr>
      <tr>
        <td class="text-blue-800 text-xl px-3 pt-3">28</td>
        <td class="text-blue-800 text-xl px-3 pt-3">1</td>
        <td class="text-blue-800 text-xl px-3 pt-3">2</td>
        <td class="text-blue-800 text-xl px-3 pt-3">3</td>
        <td class="text-blue-800 text-xl px-3 pt-3">4</td>
        <td class="text-blue-800 text-xl px-3 pt-3">5</td>
        <td class="text-blue-800 text-xl px-3 pt-3">6</td>
      </tr>
      <tr>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">x</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">-</td>
      </tr>
      <tr>
        <td class="text-blue-800 text-xl px-3 pt-3">7</td>
        <td class="text-blue-800 text-xl px-3 pt-3">8</td>
        <td class="text-blue-800 text-xl px-3 pt-3">9</td>
        <td class="text-blue-800 text-xl px-3 pt-3">10</td>
        <td class="text-blue-800 text-xl px-3 pt-3">11</td>
        <td class="text-blue-800 text-xl px-3 pt-3">12</td>
        <td class="text-blue-800 text-xl px-3 pt-3">13</td>
      </tr>
      <tr>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">x</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">-</td>
      </tr>
      <tr>
        <td class="text-blue-800 text-xl px-3 pt-3">14</td>
        <td class="text-blue-800 text-xl px-3 pt-3">15</td>
        <td class="text-blue-800 text-xl px-3 pt-3">16</td>
        <td class="text-blue-800 text-xl px-3 pt-3">17</td>
        <td class="text-blue-800 text-xl px-3 pt-3">18</td>
        <td class="text-blue-800 text-xl px-3 pt-3">19</td>
        <td class="text-blue-800 text-xl px-3 pt-3">20</td>
      </tr>
      <tr>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">x</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">-</td>
      </tr>
      <tr>
        <td class="text-blue-800 text-xl px-3 pt-3">21</td>
        <td class="text-blue-800 text-xl px-3 pt-3">22</td>
        <td class="text-blue-800 text-xl px-3 pt-3">23</td>
        <td class="text-blue-800 text-xl px-3 pt-3">24</td>
        <td class="text-blue-800 text-xl px-3 pt-3">25</td>
        <td class="text-blue-800 text-xl px-3 pt-3">26</td>
        <td class="text-blue-800 text-xl px-3 pt-3">27</td>
      </tr>
      <tr>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">x</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">-</td>
      </tr>
      <tr>
        <td class="text-blue-800 text-xl px-3 pt-3">28</td>
        <td class="text-blue-800 text-xl px-3 pt-3">29</td>
        <td class="text-blue-800 text-xl px-3 pt-3">30</td>
        <td class="text-blue-800 text-xl px-3 pt-3">31</td>
        <td class="text-blue-800 text-xl px-3 pt-3">1</td>
        <td class="text-blue-800 text-xl px-3 pt-3">2</td>
        <td class="text-blue-800 text-xl px-3 pt-3">3</td>
      </tr>
      <tr>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">x</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">o</td>
        <td class="text-red-600 text-xl px-3 pb-2">-</td>
      </tr>
    </table>
  </div>
</div>
</template>

<script>
export default {
  methods: {
    dismiss_calendar() {
      if ($("#calendar-dialog").is(':visible')) {
        $("#calendar-bg").hide()
        $("#calendar-dialog").hide("normal", function() {
          $('body, html').css({"overflow": "visible", "height": "auto"});
        });
      }
    }
  },
}
</script>

<style scoped>
</style>
