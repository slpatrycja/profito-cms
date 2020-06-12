import _ from 'lodash';
import servicesRepository from '../repositories/services_repository';

export const getters = {
  services: state => state.services,
};

export const mutations = {
  set(state, value) {
    state.services = value;
  },
};

export const actions = {
  async index(context, { country, serviceType }) {
    const data = await servicesRepository.index({ country, serviceType });
    context.commit('set', data);
  },
};

export default {
  namespaced: true,
  state: {
    services: null,
  },
  getters,
  mutations,
  actions,
};
