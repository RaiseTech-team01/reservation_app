import axios from "axios";
import Router from "../../router/router";

const state =  {
  date:"",
  hour:"",
  minute:"",
  number_people:"",
  menu:"apple",
  budget:"",
  inquiry:"20",
  errs:[],
}

const mutations = {
  setdata(state, data) {
    state.date=data.date;
    state.hour=data.hour;
    state.minute=data.minute;
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

