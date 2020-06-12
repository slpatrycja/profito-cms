import _ from 'lodash';
import taxesRepository from '../../repositories/client/taxes_repository';

export const getters = {
  taxes: state => state.taxes,
};

export const mutations = {
  set(state, value) {
    state.taxes = value;
  },
};

export const actions = {
  async index(context, { clientId, country }) {
    const data = await taxesRepository.index({ clientId, country });
    context.commit('set', data);
  },
  async create(context, { clientId, country, clientService }) {
    taxesRepository.create({ clientId, clientService });

    const data = await taxesRepository.index({ clientId, country });
    context.commit('set', data);
  },
};

export default {
  namespaced: true,
  state: {
    taxes: null,
  },
  getters,
  mutations,
  actions,
};
