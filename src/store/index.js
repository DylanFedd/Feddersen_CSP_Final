import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    msg: "This program will help make it easier to keep track on what items you have and the ones you still need",
    students: [],
    auth: false,
    session: "",
    user: {
      fname: "",
      lname: "",
      email: "",
      id: null
    }
  },
  getters: {
    onlyDeanList: function(state) {
      return state.students.filter(function(student){
          return student.GPA > 3.5;
      });
    },
    onlyDeanListCount: function(state,getters) {
      return getters.onlyDeanList.length;
    }
  },
  mutations: {
    addStudent: function(state, payload) {
      state.students.push(Object.assign({},payload));
    },
    clearStudent: function(state) {
      state.students = []
    },
    setAuth: function(state, payload) {
      state.auth = payload.auth;
      state.session = payload.session;
    },
    setUser: function(state, payload) {
      state.user.fname = payload.fname;
      state.user.lname = payload.lname;
      state.user.email = payload.email;
      state.user.id = payload.id;
    }
  },
  actions: {
    clearStudent: function(context) {
      context.commit("clearStudent");
    }
  },
  modules: {
  }
})
