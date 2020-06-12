import _ from 'lodash';
import globalServicesRepository from '../../repositories/client/global_services_repository';

export const getters = {
  globalServices: state => state.globalServices,
};

export const mutations = {
  set(state, value) {
    state.globalServices = value;
  },
};

export const actions = {
  async index(context, { clientId, country }) {
    const data = await globalServicesRepository.index({ clientId, country });
    context.commit('set', data);
  },
};

export default {
  namespaced: true,
  state: {
    globalServices: [],
  },
  getters,
  mutations,
  actions,
};
