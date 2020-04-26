import Vue from 'vue';
import Vuex from 'vuex';
import clients from './clients';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    clients,
  },
});
