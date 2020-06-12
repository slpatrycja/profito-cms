import _ from 'lodash';
import logsRepository from '../../repositories/client/logs_repository';

export const getters = {
  clientLogs: state => state.clientLogs,
};

export const mutations = {
  set(state, value) {
    state.clientLogs = value;
  },
};

export const actions = {
  async index(context, { clientId }) {
    const data = await logsRepository.index({ clientId });
    context.commit('set', data);
  },
};

export default {
  namespaced: true,
  state: {
    clientLogs: null,
  },
  getters,
  mutations,
  actions,
};
