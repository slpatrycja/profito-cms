import Vue from 'vue';
import _ from 'lodash';
import clientsRepository from '../repositories/clients_repository';

export const getters = {
  clients: state => state.clients,
};

export const mutations = {
  set(state, value) {
    state.clients = value;
  },
};

export const actions = {
  async index(context) {
    const data = await clientsRepository.index();
    context.commit('set', data);
  },
};

export default {
  namespaced: true,
  state: {
    clients: [],
    nextPageToken: null,
  },
  getters,
  mutations,
  actions,
};
