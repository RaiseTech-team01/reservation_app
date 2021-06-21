// const getters = {
//     userData: state => state.userData,
//     // ここに追記していく
// }
// export default getters


const state =  {
    "email"  : "",
    "uid"   :  "",
    "id"   :   "0",
    "provider"  : "",
    "allow_password_change" : false,
    "name" : "",
    "furigana" : "",
    "image" : null,
    "tel" : "",
    "birthday" : "",
    "gender" : "",
    "address" : ""

}

const mutations = {
    setname(state, data) {
        state.name = data
    }
}

const actions = {
    update({ commit }, data) {
        console.log(data)
        commit('setname', data.name)
    }
}


export default {
    namespaced: true,
    state,
    mutations,
    actions
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

