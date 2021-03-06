/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from "vue"
import VueRouter from "vue-router"
import router from "../router/router.js"
import App from "../app.vue"
import Vuex from "vuex"
import store from "../store"
import VCalendar from "v-calendar"

Vue.use(VueRouter)
Vue.use(Vuex)
Vue.use(VCalendar)

document.addEventListener("DOMContentLoaded", () => {
  const app = new Vue({
    router,
    store,

    render: (h) => h(App),
  }).$mount()
  document.body.appendChild(app.$el)

  console.log(app)
})
