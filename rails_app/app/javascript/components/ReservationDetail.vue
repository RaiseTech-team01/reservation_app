<template>
<div class="main m-0">
  <dir class="header m-0 text-center pl-0">
    <Header />
  </dir>
  <main>
    <dir class="navigation hidden md:block m-0 p-0">
      <Navigation />
    </dir>
      <div>
        <div>
          <div class="grid grid-cols-6 grid-rows-6 gap-2">
            <div class="col-span-2 row-span-6 h-auto">
                  <img
      class="storemenu_img"
      src="/storemenu/image01.png"
      alt="storemenu01"
    />
              </div>
            <div class="col-span-2 row-span-6 bg-blue-100 h-auto">                <form>
            <table class="m-2 table-auto max-w-full md:w-full md:text-center">
              <tr class="h-24">
                <td class="block md:w-1/5 md:table-cell text-3xl md:text-4xl form-table-padding md:pl-6 text-blue-800">店舗</td>
                <td class="block md:table-cell space-x-4 pb-6 md:pb-0">
                  <div>
                    <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold">イロハ駅前店</p>
                  </div>
                </td>
              </tr>
              <tr class="h-24">
                <td class="block md:table-cell text-3xl md:text-4xl form-table-padding md:pl-6 text-blue-800">日付</td>
                <td class="block md:table-cell pb-6 md:pb-0">
                  <div>
                    <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold">2021年3月21日</p>
                  </div>
                </td>
              </tr>
              <tr class="h-24">
                <td class="block md:table-cell text-3xl form-table-padding md:pl-6 text-blue-800">時間帯</td>
                <td class="block md:table-cell pb-6 md:pb-0">
                  <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold break-all">18時00分～</p>
                </td>
              </tr>
              <tr class="h-24">
                <td class="block md:table-cell text-3xl form-table-padding md:pl-6 text-blue-800 whitespace-nowrap">ご利用人数</td>
                <td class="block md:table-cell pb-6 md:pb-0">
                  <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold">5名様</p>
                </td>
              </tr>
              <tr class="h-24">
                <td class="block md:table-cell text-3xl form-table-padding md:pl-6 text-blue-800">ご予算</td>
                <td class="block md:table-cell pb-6 md:pb-0">
                  <p class="inline-block md:pr-16 text-3xl text-blue-800 font-bold">3,000円</p>
                </td>
              </tr>
            </table>
          </form>
            </div>
            <div class="col-span-2 row-span-5 bg-green-100 h-auto">detail</div>
            <div class="col-span-2 row-span-1 bg-purple-100 w-full flex">
              <button class="flex-1 bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded">Cancel</button>
              <div class="flex justify-center items-center w-20">
                <input id="cancel" type="checkbox">
                </div>
              <div class="flex w-56 items-center justify-center">
                <label for="cancel">cancel料金がかかります</label>
                </div>
                <div class="flex w-24 justify-center items-center">
                  2000円
                  </div>
            </div>
            <div class="col-span-6 row-apan-6">
              <div class="google_map">
                <iframe v-bind:src="destination_url" width="100%" height="500px" style="border:0;" loading="lazy"></iframe>
            </div>
            </div>
          </div>
        </div>
      </div>
  </main>
  <dir class="footer m-0 pl-0">
    <Footer />
  </dir>
</div>
</template>

<script>
import axios from "axios"
import Router from "../router/router"
import Header from "./layout/Header.vue"
import Navigation from "./layout/Navigation.vue"
import Footer from "./layout/Footer.vue"

const headers = {
  headers: {
    Authorization: "Bearer",
    "Access-Control-Allow-Origin": "*",
    "access-token": localStorage.getItem("access-token"),
    client: localStorage.getItem("client"),
    uid: localStorage.getItem("uid")
  }
};

export default {
  data: function () {
    return {
      destination_url:'',
    }
  },
  created() {
      this.getStoremap()
  },

  components: {
    Header,
    Navigation,
    Footer
  },

  methods: {
    getStoremap(){
      axios.get('/api/v1/user/storemap/1', headers).then((response) =>{
        this.destination_url = response.data.url
      })
    },
    back() {
      Router.back()
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
}

.google_map{
  width: 100%;
  height:500px;
}

.storemenu_img{
  height: 500px;
}
</style>
