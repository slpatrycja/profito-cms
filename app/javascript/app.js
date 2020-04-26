import Vue from 'vue';
import { sync } from 'vuex-router-sync';
import moment from 'moment';
import 'moment-timezone';
import VueAxios from 'vue-axios';
import VTooltip from 'v-tooltip';
import InfiniteLoading from 'vue-infinite-loading';
import vueNumeralFilterInstaller from 'vue-numeral-filter';
import linkify from 'vue-linkify';

import App from './components/App.vue';
import store from './store';
import router from './router';
import i18n from './i18n';
import httpClient from './utils/http_client';
import quickNotice from './utils/quick_notice';
import './utils/filters';

import Vuetify from 'vuetify'
import 'vuetify/dist/vuetify.min.css'
import 'material-design-icons-iconfont/dist/material-design-icons.css'
import '@mdi/font/css/materialdesignicons.css'

Vue.use(Vuetify)
Vue.directive('linkified', linkify);
Vue.use(VueAxios, httpClient);
Vue.axios.defaults.baseURL = '/api/';
Vue.router = router;

Vue.use(quickNotice, {});
Vue.use(VTooltip);
VTooltip.enabled = window.innerWidth > 768;
Vue.use(InfiniteLoading, {
  slots: {
    noResults: '',
    noMore: '',
    error: 'Something went wrong.',
  },
});

sync(store, router);

moment.tz.setDefault('UTC');
window.EventBus = new Vue();

const app = new Vue({
  vuetify: new Vuetify(),
  router,
  store,
  i18n,
  render: h => h(App),
}).$mount('#app');

export default app;
