import axios from "axios"
import Router from "../../router/router"

const state = {
  first_name: "",
  last_name: "",
  email: "",
  first_furigana: "",
  last_furigana: "",
  tel: "",
  birthday: "",
  gender: "",
  address: "",
  password: "",
  password_confirmation: "",
  errs: [],
}

const mutations = {
  setdata(state, data) {
    state.first_name = data.first_name
    state.last_name = data.last_name
    state.email = data.email
    state.first_furigana = data.first_furigana
    state.last_furigana = data.last_furigana
    state.tel = data.tel
    state.birthday = data.birthday
    state.gender = data.gender
    state.address = data.address
    state.password = data.password
    state.password_confirmation = data.password_confirmation
  },
  setErr(state, data) {
    state.errs = data
  },
}

const actions = {
  // post({commit, getters, dispatch}){
  //   const addUserParams = getters.registrationUserData
  //   console.log(getters)
  //   addUserParams.name = addUserParams.last_name+ " " + addUserParams.first_name
  //   addUserParams.furigana = addUserParams.last_furigana + " " + addUserParams.first_furigana
  //
  //   delete addUserParams.errs
  //   delete addUserParams.last_furigana
  //
  //
  //   axios
  //     .post("/api/v1/auth/", addUserParams)
  //     .then(function (response) {
  //       console.log(response)
  //       Router.push("/sign_up_complete")
  //     })
  //     .catch(error => {
  //       console.log(error.response.data.errors.full_messages)
  //       dispatch('registrationUserData/updateErr', error.response.data.errors.full_messages)
  //       Router.push("/sign_up")
  //     })
  //
  // },

  updateErr({ commit }, data) {
    commit("setErr", data)
  },
  update({ commit }, data) {
    console.log(data)
    commit("setdata", data)
  },
}

export default {
  namespaced: true,
  state,
  mutations,
  actions,
}
