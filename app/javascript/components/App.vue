<template>
  <div class="content-wrapper">
    <router-view />
  </div>
</template>

// <script>
// import { mapState } from 'vuex';
//
// export default {
//   computed: {
//     ...mapState({
//     }),
//   },
//   created() {
//     window.EventBus.$on('server-error', () => {
//       this.$notify({ type: 'error', body: this.$t('server_error') });
//     });
//
//     window.EventBus.$on('forbidden-error', () => {
//       this.$router.push({ name: 'forbidden' });
//     });
//
//     window.EventBus.$on('not-found-error', () => {
//       this.$router.push({ name: 'not_found' });
//     });
//   },
// };
// </script>
