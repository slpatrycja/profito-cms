import httpClient from '../../utils/http_client';

export default {
  async index({ clientId, country }) {
    const response = await httpClient.get(`/clients/${clientId}/taxes.json`, { params: { country } });

    return response.data;
  },
};
