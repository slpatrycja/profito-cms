import Vue from 'vue';
import Vuex from 'vuex';
import clients from './clients';
import taxes from './client/taxes';
import benefits from './client/benefits';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    clients,
    taxes,
    benefits,
  },
});
