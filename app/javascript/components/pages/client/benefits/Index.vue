<template>
  <div class="main-wrapper">
    <div v-if="!country">
      <select-country :client-id="clientId" :type="'benefits'"/>
    </div>

    <v-card v-else-if="country && isLoaded" class="main-card">
      <div class="btn--expand">
        <v-btn color="#BF0927" dark>
          <router-link :to="{ name: 'client-benefits-new', params: { clientId, country } }">Add new benefit</router-link>
        </v-btn>
      </div>
      <v-data-table
        :headers="headers"
        :loading="!isLoaded"
        :items="benefits"
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
      benefits: state => state.benefits.benefits,
    }),
    isLoaded() {
      return this.benefits;
    },
  },
  watch: {
    country() {
      this.getBenefits();
    },
  },
  created() {
    if (this.country) {
      this.getBenefits();
    }
  },
  methods: {
    getBenefits() {
      this.$store.dispatch('benefits/index', { clientId: this.clientId, country: this.country });
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

.btn--expand {
  display: flex;
  flex-direction: row-reverse;
  margin: 15px;

  a {
    text-decoration: none;
    color: white;
  }
}
</style>
