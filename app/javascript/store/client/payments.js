import _ from 'lodash';
import paymentsRepository from '../../repositories/client/payments_repository';

export const getters = {
  payments: state => state.payments,
  debts: state => state.debts,
  summary: state => state.summary,

};

export const mutations = {
  set(state, data) {
    state.payments = data.payments;
    state.debts = data.debts;
    state.summary = data.total;
  },
};

export const actions = {
  async index(context, { clientId }) {
    const data = await paymentsRepository.index({ clientId });
    context.commit('set', data);
  },

  async create(context, payment) {
    await paymentsRepository.create(payment);

    const data = await paymentsRepository.index({ clientId });
    context.commit('set', data);
  },
};

export default {
  namespaced: true,
  state: {
    payments: null,
    debts: null,
    summary: null,
  },
  getters,
  mutations,
  actions,
};
