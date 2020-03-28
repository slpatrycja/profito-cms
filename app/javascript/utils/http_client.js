import _ from 'lodash';
import axios from 'axios';
import qs from 'qs';
import { deepHashSnakeCase, deepHashCamelCase } from './convert_keys';

const checkImpersonate = (data, headers) => {
  let impersonating = false;
  try {
    impersonating = !_.isNil(localStorage.getItem('impersonate_auth_token'));
  } catch (e) { impersonating = false; }

  if (impersonating) {
    headers.common.Impersonating = true;
  }

  return data;
};

const httpClient = axios.create({
  transformRequest: [
    (data => (data ? deepHashSnakeCase(data) : undefined)),
    ...axios.defaults.transformRequest,
    checkImpersonate,
  ],
  transformResponse: [...axios.defaults.transformResponse, deepHashCamelCase],
  paramsSerializer: params => qs.stringify(deepHashSnakeCase(params), { arrayFormat: 'brackets', skipNulls: true }),
});

httpClient.interceptors.response.use(response => response, (error) => {
  if (error.response.status >= 500) {
    window.EventBus.$emit('server-error', {});
  }

  if (error.response.status === 403) {
    window.EventBus.$emit('forbidden-error', {});
  }

  if (error.response.status === 404 && error.response.data.error === 'NotFoundError') {
    window.EventBus.$emit('not-found-error', {});
  }

  return Promise.reject(error.response.data);
});

export default httpClient;
