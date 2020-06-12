import _ from 'lodash';
import officesRepository from '../repositories/offices_repository';

export const getters = {
  offices: state => state.offices,
};

export const mutations = {
  set(state, value) {
    state.offices = value;
  },
};

export const actions = {
  async index(context, { country, serviceType }) {
    const data = await officesRepository.index({ country, serviceType });
    context.commit('set', data);
  },
};

export default {
  namespaced: true,
  state: {
    offices: null,
  },
  getters,
  mutations,
  actions,
};
