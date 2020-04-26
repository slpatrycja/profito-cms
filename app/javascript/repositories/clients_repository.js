import httpClient from '../utils/http_client';

export default {
  async index(nextPageToken = null) {
    const response = await httpClient.get(`/clients.json`, { params: { next_page_token: nextPageToken } });

    return response.data;
  },
};
