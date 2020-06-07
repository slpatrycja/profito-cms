<template>
  <div v-if="isLoaded" class="main-wrapper">
    <div v-if="!country">
      <select-country :client-id="clientId" :type="'taxes'"/>
    </div>

    <v-card v-else class="main-card">
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
        :items="taxes"
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
import SelectCountry from '../../../elements/client/SelectCountry.vue';

export default {
  components: {
    SelectCountry,
  },
  props: {
    clientId: { type: [String, Number], required: true },
    country: { type: String, required: false },
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
        { text: 'Year', value: 'year' },
        { text: 'Office', value: 'officeName' },
        { text: 'Created at', value: 'createdAt' },
        { text: 'Status', value: 'status' },
        { text: 'Updated at', value: 'updatedAt' },
        { text: 'Shipment date', value: 'shipmentDate' },
        { text: 'Comments', value: 'comments' },
      ],
    };
  },
  computed: {
    ...mapState({
      taxes: state => state.taxes.taxes,
    }),
    isLoaded() {
      return this.taxes;
    },
  },
  created() {
    if (this.country) {
      this.getTaxes();
    }
  },
  methods: {
    getTaxes() {
      this.$store.dispatch('taxes/index', { clientId: this.clientId, country: this.country });
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
