import _ from 'lodash';
import clientsRepository from '../repositories/clients_repository';

export const getters = {
  clients: state => state.clients,
  client: state => state.client,
};

export const mutations = {
  set(state, value) {
    state.clients = value;
  },
  setClient(state, value) {
    state.client = value;
  },
};

export const actions = {
  async index(context) {
    const data = await clientsRepository.index();
    context.commit('set', data);
  },
  async get(context, id) {
    const data = await clientsRepository.get(id);
    context.commit('setClient', data);
  },
};

export default {
  namespaced: true,
  state: {
    clients: [],
    client: null,
    nextPageToken: null,
  },
  getters,
  mutations,
  actions,
};
