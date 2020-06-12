import Vue from 'vue';
import VueRouter from 'vue-router';

import Dashboard from './components/Dashboard.vue'
import ClientDashboard from './components/pages/client/Dashboard.vue'
import ClientProfile from './components/pages/client/Profile.vue'
import ClientTaxes from './components/pages/client/taxes/Index.vue'
import ClientBenefits from './components/pages/client/benefits/Index.vue'
import ClientGlobalServices from './components/pages/client/others/Index.vue'

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
      path: '/clients/:clientId/taxes/:country?',
      name: 'client-taxes',
      component: ClientTaxes,
      props: true,
    },
    {
      path: '/clients/:clientId/benefits/:country?',
      name: 'client-benefits',
      component: ClientBenefits,
      props: true,
    },
    {
      path: '/clients/:clientId/other-services',
      name: 'client-others',
      component: ClientGlobalServices,
      props: true,
    },
    {
      path: '/clients/:clientId/profile',
      name: 'client-profile',
      component: ClientProfile,
      props: true,
    },
    {
      path: '/clients/:id',
      name: 'client-dashboard',
      component: ClientDashboard,
      props: true,
    },
    {
      path: '/clients',
      name: 'clients',
      component: Dashboard,
    },
    {
      path: '*',
      name: 'not_found',
      component: NotFound,
    },
  ],
});
