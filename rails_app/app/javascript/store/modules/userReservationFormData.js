import axios from "axios";
import Router from "../../router/router";

const state =  {
  date:"",
  // date_at:"",
  // date_on:"",
  number_people:"",
  // menu:"",
  budget:"",
  // inquiry:"",
  errs:[],
}

const mutations = {
  setdata(state, data) {
    state.date=data.date;
    // date_at:"";
    // date_on:"";
    state.number_people=data.number_people;
    // menu:"";
    state.budget=data.budget;
    // inquiry:"";
  },
  setErr(state, data){
    state.errs = data
  }
}

const actions = {
  updateErr({ commit }, data) {
    commit('setErr', data)
  },
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

