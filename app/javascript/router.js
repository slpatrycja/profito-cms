import Vue from 'vue';
import VueRouter from 'vue-router';


Vue.use(VueRouter);

export default new VueRouter({
  mode: 'history',
  base: '/app',
  routes: [
    {
      path: '*',
      name: 'not_found',
      component: NotFound,
    },
  ],
});
