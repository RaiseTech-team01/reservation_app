// const getters = {
//     userData: state => state.userData,
//     // ここに追記していく
// }
// export default getters

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

// const store = new Vuex.Store({
//     state: {
//         "userHeaders" :
//             {
//                 "access-token" : "",
//                 "uid" : "",
//                 "client" : ""
//             },
//
//         "userData" :
//             {
//                 "email"  : "",
//                 "uid"   :  "",
//                 "id"   :   "0",
//                 "provider"  : "",
//                 "allow_password_change" : false,
//                 "name" : "",
//                 "furigana" : "",
//                 "image" : null,
//                 "tel" : "",
//                 "birthday" : "",
//                 "gender" : "",
//                 "address" : ""
//             }
//
//     },
//
//     mutations: {
//         setuserData(state, data) {
//             state.userData = data
//         }
//     },
//     actions: {
//         updateuserData({ commit }, data) {
//             commit('setuserData', data)
//         }
//     }
// })
