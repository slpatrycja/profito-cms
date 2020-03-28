import _ from 'lodash';

let noticeTimer = null;

function displayNotice(data) {
  const noticeData = _.defaults({}, data, { timer: true });

  this.$store.commit('notices/setQuickNotice', noticeData);

  if (noticeTimer) {
    clearTimeout(noticeTimer);
  }

  if (noticeData.timer) {
    noticeTimer = setTimeout(() => {
      this.$store.commit('notices/setQuickNotice', null);
    }, 5000);
  }
}

export default {
  install(Vue) {
    Vue.notify = displayNotice;
    Vue.prototype.$notify = displayNotice;
  },
};
