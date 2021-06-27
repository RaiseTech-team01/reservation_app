const state =  {
  first_name:"",
  last_name:"",
  email:"",
  first_furigana:"",
  last_furigana:"",
  tel:"",
  birthday:"",
  gender:"",
  address:"",
  password:"",
  password_confirmation:""
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
    state.password_confirmation= data.password_confirmation
  }
}

const actions = {
  update({ commit }, data) {
    console.log(data)
    commit('setdata', data)
  }
}


export default {
  namespaced: true,
  state,
  mutations,
  actions
}

