import httpClient from '../../utils/http_client';

export default {
  async index({ clientId, country }) {
    const response = await httpClient.get(`/clients/${clientId}/taxes.json`, { params: { country } });

    return response.data;
  },

  async create({ clientId, clientService }) {
    const response = await httpClient.post(`/clients/${clientId}/taxes.json`, { clientService });

    return response.data;
  },
};
