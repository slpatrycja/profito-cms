<template>
  <div v-if="isLoaded" class="wrapper">
    <v-banner
      single-line
      :sticky="sticky">
      <h4>{{ $i18n.t('client_form.editing') }} {{ client.name }} {{ client.surname }}...</h4>
    </v-banner>
    <client-form :client="client" />
  </div>
</template>

<script>
import { mapState } from 'vuex';
import ClientForm from '../../elements/client/Form.vue';

export default {
  components: {
    ClientForm,
  },
  props: {
    id: { type: [String, Number], required: true }
  },
  computed: {
    ...mapState({
      client: state => state.clients.client,
    }),
    isLoaded() {
      return this.client;
    },
  },
  created() {
    this.getClient();
  },
  methods: {
    getClient() {
      this.$store.dispatch('clients/get', this.id);
    },
  },
};
</script>

<style lang="scss" scoped>
.wrapper {
  width: 60vw;
}
</style>
