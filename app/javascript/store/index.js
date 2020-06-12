import Vue from 'vue';
import Vuex from 'vuex';
import clients from './clients';
import taxes from './client/taxes';
import benefits from './client/benefits';
import globalServices from './client/global_services';
import payments from './client/payments';
import clientLogs from './client/logs';

Vue.use(Vuex);

export default new Vuex.Store({
  modules: {
    clients,
    taxes,
    benefits,
    globalServices,
    payments,
    clientLogs
  },
});
