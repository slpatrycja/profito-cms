<template>
  <div class="wrapper">
    <v-banner>
      <h4>New client</h4>
    </v-banner>
    <client-form />
  </div>
</template>

<script>
import { mapState } from 'vuex';
import ClientForm from '../../elements/client/Form.vue';

export default {
  components: {
    ClientForm,
  },
};
</script>

<style lang="scss" scoped>
.wrapper {
  width: 60vw;
}
</style>
