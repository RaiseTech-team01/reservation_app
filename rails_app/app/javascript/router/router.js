import Vue from "vue";
import Router from "vue-router";
import SignUp from "../components/Registration.vue";
import Login from "../components/Login.vue";

Vue.use(Router);

const router = new Router({
  mode: "history",
  routes: [
    //ルーティングの設定
    {
      path: '/sign_up',
      component: Registration
    },
    {
      path: '/login',
      component: Login
    },
  ],
});
export default router;
