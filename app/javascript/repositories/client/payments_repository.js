import httpClient from '../../utils/http_client';

export default {
  async index({ clientId }) {
    const response = await httpClient.get(`/clients/${clientId}/payments.json`);

    return response.data;
  },

  async create(payment) {
    const response = await httpClient.post(`/clients/${payment.clientId}/payments.json`, { payment });

    return response.data;
  },
};
