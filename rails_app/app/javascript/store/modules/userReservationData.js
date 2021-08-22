const state = {
  reservationDataArray: [],
  errs: "",
}

const mutations = {
  setdata(state, data) {
    state.reservationDataArray = data
  },
  setErr(state, data) {
    state.errs = data
  },
}

const actions = {
  updateErr({ commit }, data) {
    console.log("error:" + data)
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
