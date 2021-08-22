const state = {
  isLogin: false,
}

const mutations = {
  setlogin(state, data) {
    state.isLogin = data
  },
}

const actions = {
  updateLogin({ commit }, data) {
    console.log(data)
    commit("setlogin", data)
  },
}

export default {
  namespaced: true,
  state,
  mutations,
  actions,
}
