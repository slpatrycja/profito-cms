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
        :loading="!isLoaded"
        :items="services"
        :search="search"
        :items-per-page="12"
        :footer-props="{ itemsPerPageOptions: [12] }"
        class="elevation-1"
      ></v-data-table>
    </v-card>
  </div>
</template>

<script>
import { mapState } from 'vuex';

export default {
  props: {
    clientId: { type: [String, Number], required: true },
  },
  data() {
    return {
      search: null,
      headers: [
        {
          text: 'Name',
          align: 'start',
          value: 'serviceName',
        },
        { text: 'Created at', value: 'createdAt' },
        { text: 'Comments', value: 'comments' },
      ],
    };
  },
  computed: {
    ...mapState({
      services: state => state.globalServices.globalServices,
    }),
    isLoaded() {
      return this.services;
    },
  },
  created() {
    this.getServices();
  },
  methods: {
    getServices() {
      this.$store.dispatch('globalServices/index', { clientId: this.clientId });
    },
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
