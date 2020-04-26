import httpClient from '../utils/http_client';

export default {
  async index(nextPageToken = null) {
    const response = await httpClient.get(`/clients.json`, { params: { next_page_token: nextPageToken } });

    return response.data;
  },
  async get(id) {
    const response = await httpClient.get(`/clients/${id}.json`);

    return response.data;
  },
};
