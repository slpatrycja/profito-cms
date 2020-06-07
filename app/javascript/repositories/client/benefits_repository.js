import httpClient from '../../utils/http_client';

export default {
  async index({ clientId, country }) {
    const response = await httpClient.get(`/clients/${clientId}/benefits.json`, { params: { country } });

    return response.data;
  },
};
