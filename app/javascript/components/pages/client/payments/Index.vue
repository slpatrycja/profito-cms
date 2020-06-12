<template>
  <div v-if="isLoaded" class="main-wrapper">
    <v-container>
      <v-row>
        <v-col>
          <v-card class="pa-2">
            <v-data-table
              :headers="paymentsHeaders"
              :loading="!isLoaded"
              :items="payments"
              :hide-default-footer="true"
              class="elevation-1"
            ></v-data-table>
          </v-card>
        </v-col>

        <v-col>
          <v-card class="pa-2">
            <v-data-table
              :headers="debtHeaders"
              :loading="!isLoaded"
              :items="debts"
              :hide-default-footer="true"
              class="elevation-1"
            ></v-data-table>
          </v-card>
        </v-col>
      </v-row>

      <v-row>
        <v-col>
          <v-card class="pa-2 payments-summary">
            <span>
              <h4>Total: {{ summary }}</h4>
            </span>
          </v-card>
        </v-col>
      </v-row>
    </v-container>
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
      paymentsHeaders: [
        {
          text: 'Value',
          align: 'start',
          value: 'value',
        },
        { text: 'Added at', value: 'createdAt' },
        { text: 'Author', value: 'author' },
      ],
      debtHeaders: [
        {
          text: 'Service name',
          align: 'start',
          value: 'serviceName',
        },
        { text: 'Price', value: 'price' },
      ],
    };
  },
  computed: {
    ...mapState({
      payments: state => state.payments.payments,
      debts: state => state.payments.debts,
      summary: state => state.payments.summary,
    }),
    isLoaded() {
      return this.payments && this.debts && this.summary !== null;
    },
  },
  created() {
    this.getPayments();
  },
  methods: {
    getPayments() {
      this.$store.dispatch('payments/index', { clientId: this.clientId });
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

.payments-summary {
  width: 40%;
  margin: auto;

  h4 {
    color: #BF0927;
    padding: 20px;
    text-align: center;
  }
}
</style>
