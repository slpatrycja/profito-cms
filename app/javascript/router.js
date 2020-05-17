import Vue from 'vue';
import VueRouter from 'vue-router';

import Dashboard from './components/Dashboard.vue'
import ClientDashboard from './components/pages/client/Dashboard.vue'
import ClientProfile from './components/pages/client/Profile.vue'
import NotFound from './components/pages/NotFound.vue'

Vue.use(VueRouter);

export default new VueRouter({
  mode: 'history',
  base: '/app',
  routes: [
    {
      path: '',
      name: 'dashboard',
      component: Dashboard,
    },
    {
      path: '/clients',
      name: 'clients',
      component: Dashboard,
    },
    {
      path: '/clients/:id',
      name: 'client-dashboard',
      component: ClientDashboard,
      props: true,
    },
    {
      path: '/clients/:id/profile',
      name: 'client-profile',
      component: ClientProfile,
      props: true,
    },
    {
      path: '*',
      name: 'not_found',
      component: NotFound,
    },
  ],
});
