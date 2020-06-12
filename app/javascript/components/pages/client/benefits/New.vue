<template>
  <div class="wrapper">
    <v-banner>
      <h4>New benefit</h4>
    </v-banner>
    <client-service-form :clientId="clientId" :country="country" type="benefit" />
  </div>
</template>

<script>
import ClientServiceForm from '../../../elements/client/client_services/Form.vue';

export default {
  components: {
    ClientServiceForm,
  },
  props: {
    clientId: { type: [String, Number], required: true },
    country: { type: String, required: false },
  },
};
</script>

<style lang="scss" scoped>
.wrapper {
  width: 60vw;
}
</style>
