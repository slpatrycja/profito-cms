<template>
  <div class="client-form">
    <div class="p-row">
      <v-select
        :items="offices"
        item-text="name"
        item-value="id"
        v-model="clientService.officeId"
        label="Office"
        class="p-col-md-2 client-form-input"
      ></v-select>
    </div>
    <div class="p-row">
      <v-select
        :items="services"
        item-text="name"
        item-value="id"
        v-model="clientService.serviceId"
        label="Service"
        class="p-col-md-2 client-form-input"
      ></v-select>
    </div>
    <div class="p-row">
      <v-text-field
        v-model="clientService.year"
        label="Year"
        type="number"
        class="p-col-md-2 client-form-input"
        required
      />
    </div>
    <div class="p-row">
      <v-text-field
        v-model="clientService.price"
        label="Price"
        type="number"
        class="p-col-md-2 client-form-input"
        required
      />
    </div>
    <div class="p-row">
      <v-textarea
        outlined
        v-model="clientService.comments"
        label="Comments"
        class="p-col-md-2 form-textarea"
        required
      />
    </div>

    <div class="p-row">
      <v-btn large color="primary" class="btn-save" @click.native="save">Save</v-btn>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex';
import _ from 'lodash';

export default {
  name: 'client-service-form',
  props: {
    clientId: { type: [String, Number], required: true },
    type: { type: String, required: true },
    country: { type: String, required: true },
  },
  data() {
    return {
      clientService: {
        clientId: this.clientId,
        serviceId: null,
        officeId: null,
        price: this.servicePrice,
        year: null,
        comments: null,
      },
    };
  },
  computed: {
    ...mapState({
      services: state => state.services.services,
      offices: state => state.offices.offices,
    }),
    selectedService() {
      return _.find(this.services, { id: this.clientService.serviceId });
    },
  },
  watch: {
    selectedService() {
      this.clientService.price = this.selectedService.price;
    },
  },
  created() {
    this.getServices();
    this.getOffices();
  },
  methods: {
    getServices() {
      this.$store.dispatch('services/index', { country: this.country, serviceType: this.type });
    },
    getOffices() {
      this.$store.dispatch('offices/index', { country: this.country, serviceType: this.type });
    },
    async save() {
      try {
        if (this.type === 'tax') {
          await this.$store.dispatch('taxes/create', { clientId: this.clientId, country: this.country, clientService: this.clientService });
        } else {
          await this.$store.dispatch('benefits/create', { clientId: this.clientId, country: this.country, clientService: this.clientService });
        }

        this.$router.go(-1);
      } catch(e) {
        console.log(e);
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.client-form {
  width: 60vw;
}

.p-row {
  max-width: 50%;
}

.client-form-input {
  margin: 20px;
}

.btn-save {
  margin-left: 20px;
}

.v-input {
  flex: 1 1 0;
}

.form-textarea {
  margin: 20px !important;
}
</style>
