const getters = {
  // ここに追記していく
  userData: (state) => state.userData,
  auth: (state) => state.auth,
  registrationUserData: (state) => state.registrationUserData,
  storeUserData: (state) => state.storeUserData,
  registrationStoreUserData: (state) => state.registrationStoreUserData,
  storeAuth: (state) => state.storeAuth,
  userReservationData: (state) => state.userReservationData,
  userReservationDetail: (state) => state.userReservationDetail,
  userReservationFormData: (state) => state.userReservationFormData,
}
export default getters
