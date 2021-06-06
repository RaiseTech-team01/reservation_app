import Vue from "vue";
import Router from "vue-router";
import Registration from "../components/Registration.vue";
import RegistrationConfirm from "../components/RegistrationConfirm.vue";
import RegistrationCompletion from "../components/RegistrationCompletion.vue";
import Login from "../components/Login.vue";
import AccountInfo from "../components/AccountInfo.vue";
import AccountEdit from "../components/AccountEdit.vue";
import ReservationForm from "../components/ReservationForm.vue";
import ReservationConfirm from "../components/ReservationConfirm.vue";
import ReservationCompletion from "../components/ReservationCompletion.vue";

Vue.use(Router);

const router = new Router({
  mode: "history",
  routes: [
    //ルーティングの設定
    {
      path: '/',
      component: Login
    },
    {
      path: '/home/top',
      component: Login
    },
    {
      path: '/sign_up',
      component: Registration
    },
    {
      path: '/sign_up_confirm',
      component: RegistrationConfirm
    },
    {
      path: '/sign_up_complete',
      component: RegistrationCompletion
    },
    {
      path: '/login',
      component: Login
    },
    {
      path: '/account_info',
      component: AccountInfo
    },
    {
      path: '/account_edit',
      component: AccountEdit
    },
    {
      path: '/reservation_form',
      component: ReservationForm
    },
    {
      path: '/reservation_confirm',
      component: ReservationConfirm
    },
    {
      path: '/reservation_complete',
      component: ReservationCompletion
    },
  ],
});
export default router;
