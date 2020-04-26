<template>
  <div v-if="isLoaded" class="main-wrapper">
    <v-card class="main-card">
      <v-card-title>
        <v-text-field
          v-model="search"
          label="Search"
          single-line
          hide-details
        ></v-text-field>
      </v-card-title>
      <v-data-table
        :headers="headers"
        :loading="true"
        :items="clients"
        :search="search"
        :items-per-page="12"
        :footer-props="{ itemsPerPageOptions: [12] }"
        @click:row="showSingleClient"
        class="elevation-1"
      ></v-data-table>
    </v-card>
  </div>
</template>

<script>
import { mapState } from 'vuex';

export default {
  data() {
    return {
      search: null,
      headers: [
        {
          text: 'Surname',
          align: 'start',
          value: 'surname',
        },
        { text: 'Name', value: 'name' },
        { text: 'City', value: 'city' },
        { text: 'Telephone', value: 'telephone' },
      ],
    };
  },
  computed: {
    ...mapState({
      clients: state => state.clients.clients,
    }),
    isLoaded() {
      return this.clients;
    },
  },
  created() {
    this.getClients();
  },
  methods: {
    getClients() {
      this.$store.dispatch('clients/index');
    },
    showSingleClient(client) {
      this.$router.push({ name: 'client-dashboard', params: { id: client.id }});
    }
  },
};
</script>

<style lang="scss" scoped>
.main-wrapper {
  display: flex;
  align-items: center;
  padding-top: 50px;
  padding-left: 50px;
}
.main-card {
  width: 100%;
}
</style>
