/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from "vue";
import VueRouter from "vue-router";
import router from "../router/router.js";
import App from "../app.vue";
import Vuex from "vuex";
import store from "../store";
import VCalendar from "v-calendar";

Vue.use(VueRouter);
Vue.use(Vuex);
Vue.use(VCalendar);

// 雛形
// const store = new Vuex.Store({
//   state: {
//     text: ''
//   },
//   getters: {
//     todos(state) {
//       return state.text
//     }
//   },
//   mutations: {
//     setTodo(state, data) {
//       state.text = data
//     }
//   },
//   actions: {
//     updateTodos({ commit }, data) {
//       commit('setTodo', data)
//     }
//   }
// })

// 参考データ
// {"data":{"email":"user1@sample.com","uid":"user1@sample.com","id":1,"provider":"email","allow_password_change":false,"name":"ユーザー1","furigana":"ユーザー1","image":null,"tel":"123456781","birthday":"20210411","gender":"男","address":"大阪"}}⏎

document.addEventListener("DOMContentLoaded", () => {
    const app = new Vue({
        router,
        store,

        render: (h) => h(App),
    }).$mount();
    document.body.appendChild(app.$el);

    console.log(app);
});

// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>

// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks'
// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'
//
// Vue.use(TurbolinksAdapter)
//
// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: () => {
//       return {
//         message: "Can you say hello?"
//       }
//     },
//     components: { App }
//   })
// })
