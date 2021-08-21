const state = {
  email: "",
  uid: "",
  id: "",
  provider: "",
  allow_password_change: false,
  name: "",
  furigana: "",
  image: null,
  tel: "",
  birthday: "",
  gender: "",
  address: "",
  errs: [],
}

const mutations = {
  setname(state, data) {
    state.email = data.email
    state.uid = data.uid
    state.id = data.id
    state.provider = data.provider
    state.allow_password_change = data.allow_password_change
    state.name = data.name
    state.furigana = data.furigana
    state.image = data.image
    state.tel = data.tel
    state.birthday = data.birthday
    state.gender = data.gender
    state.address = data.address
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
    console.log(data)
    commit("setname", data)
  },
}

export default {
  namespaced: true,
  state,
  mutations,
  actions,
}
