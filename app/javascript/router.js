import Vue from 'vue';
import VueRouter from 'vue-router';

import Dashboard from './components/Dashboard.vue'
import NotFound from './components/pages/NotFound.vue'

Vue.use(VueRouter);

export default new VueRouter({
  mode: 'history',
  base: '/app',
  routes: [
    {
      path: '/',
      name: 'dashboard',
      component: Dashboard,
    },
    {
      path: '*',
      name: 'not_found',
      component: NotFound,
    },
  ],
});
