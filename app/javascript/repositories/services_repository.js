import httpClient from '../utils/http_client';

export default {
  async index({ country, serviceType }) {
    const response = await httpClient.get('/services.json', { params: { country, serviceType } });

    return response.data;
  },
};
