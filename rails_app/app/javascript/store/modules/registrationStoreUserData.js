// データベース登録前の店舗ユーザデータ

const state = {
    id: "",
    provider: "",
    uid: "",
    allow_password_change: "",
    name: "",
    furigana: "",
    email: "",
    tel: "",
    fax: "",
    postal_code: "",
    address: "",
    url: "",
    seat: "",
    restaurant: "",
    genre: "",
    responsible_party: "",
    other: "",
    created_at: "",
    updated_at: ""
  }
  
  const mutations = {
    setname(state, data) {
        state.id = data.id
        state.provider = data.provider
        state.uid = data.uid
        state.allow_password_change = data.allow_password_change
        state.name = data.name
        state.furigana = data.furigana
        state.email = data.email
        state.tel = data.tel
        state.fax = data.fax
        state.postal_code = data.postal_code
        state.address = data.address
        state.url = data.url
        state.seat = data.seat
        state.restaurant = data.restaurant
        state.genre = data.genre
        state.responsible_party = data.responsible_party
        state.other = data.other
        state.created_at = data.created_at
        state.updated_at = data.updated_at
    },
    setErr(state, data){
      state.errs = data
    }
  }
  
  const actions = {
    updateErr({ commit }, data) {
      commit('setErr', data)
    },
    update({commit}, data) {
      console.log(data)
      commit('setname', data)
    }
  }
  
  
  export default {
    namespaced: true,
    state,
    mutations,
    actions
  }
  