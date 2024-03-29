import axios from "axios"
import Router from "../../router/router"

// atode 後から編集
const state = {
  store_name: "",
  date: "",
  hour: "",
  minute: "",
  number_people: "",
  menu: "みかん",
  budget: "",
  inquiry: "テキスト",
  errs: [],
}

const mutations = {
  setdata(state, data) {
    state.store_name = data.store_name
    state.date = data.date
    state.hour = data.hour
    state.minute = data.minute
    state.number_people = data.number_people
    // menu:"";
    state.budget = data.budget
    // inquiry:"";
  },
  setErr(state, data) {
    state.errs = data
  },
}

const actions = {
  updateErr({ commit }, data) {
    commit("setErr", data)
  },
  update({ commit }, data) {
    commit("setdata", data)
  },
}

export default {
  namespaced: true,
  state,
  mutations,
  actions,
}
