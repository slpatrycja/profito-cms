import _ from 'lodash';
import benefitsRepository from '../../repositories/client/benefits_repository';

export const getters = {
  benefits: state => state.benefits,
};

export const mutations = {
  set(state, value) {
    state.benefits = value;
  },
};

export const actions = {
  async index(context, { clientId, country }) {
    const data = await benefitsRepository.index({ clientId, country });
    context.commit('set', data);
  },
};

export default {
  namespaced: true,
  state: {
    benefits: [],
  },
  getters,
  mutations,
  actions,
};
