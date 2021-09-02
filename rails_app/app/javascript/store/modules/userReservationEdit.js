const state = {
  rdId: "",
}

const mutations = {
  setdata(state, data) {
    state.rdId = data
  },
}

const actions = {
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
