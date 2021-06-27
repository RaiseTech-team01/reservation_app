import Vue from "vue";
import Router from "vue-router";
import RegistrationForm from "../components/RegistrationForm.vue";
import RegistrationConfirm from "../components/RegistrationConfirm.vue";
import RegistrationCompletion from "../components/RegistrationCompletion.vue";
import Login from "../components/Login.vue";
import AccountInfo from "../components/AccountInfo.vue";
import AccountEdit from "../components/AccountEdit.vue";
import ReservationForm from "../components/ReservationForm.vue";
import ReservationConfirm from "../components/ReservationConfirm.vue";
import ReservationCompletion from "../components/ReservationCompletion.vue";
import ReservationList from "../components/ReservationList.vue";
import ReservationDetail from "../components/ReservationDetail.vue";
import ReservationEdit from "../components/ReservationEdit.vue";
import ReservationHistory from "../components/ReservationHistory.vue";
import ReservationViewHistory from "../components/ReservationViewHistory.vue";

import StoreLogin from "../components/store/StoreLogin.vue";
import StoreReservationList from "../components/store/StoreReservationList.vue";
import StoreAccountForm from "../components/store/StoreAccountForm.vue";
import StoreAccountConfirm from "../components/store/StoreAccountConfirm.vue";
import StoreUserList from "../components/store/StoreUserList.vue";
import StoreDashBoard from "../components/store/StoreDashBoard.vue";
import StoreSettings from "../components/store/StoreSettings.vue";

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
      component: RegistrationForm
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
    {
      path: '/reservation_list',
      component: ReservationList
    },
    {
      path: '/reservation_detail',
      component: ReservationDetail
    },
    {
      path: '/reservation_edit',
      component: ReservationEdit
    },
    {
      path: '/reservation_history',
      component: ReservationHistory
    },
    {
      path: '/reservation_view_history',
      component: ReservationViewHistory
    },
    {
      path: '/store_login',
      component: StoreLogin
    },
    {
      path: '/store_reservation_list',
      component: StoreReservationList
    },
    {
      path: '/store_account_form',
      component: StoreAccountForm
    },
    {
      path: '/store_account_confirm',
      component: StoreAccountConfirm
    },
    {
      path: '/store_user_list',
      component: StoreUserList
    },
    {
      path: '/store_dash_board',
      component: StoreDashBoard
    },
    {
      path: '/store_settings',
      component: StoreSettings
    },
  ],
});
export default router;
