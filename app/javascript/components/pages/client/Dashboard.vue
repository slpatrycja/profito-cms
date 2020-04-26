<template>
  <div v-if="isLoaded" class="main-wrapper">
    <div class="actions-wrapper">
      <div v-for="action in actions" class="p-col-md-3 action-card">
        <v-card
          :color="black"
          class="d-flex align-center"
          height="250"
          width="250"
          @click="toggle">
          <span class="action-title">{{ action }}</span>
        </v-card>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex';

export default {
  props: {
    id: { type: [String, Number], required: true }
  },
  data() {
    return {
      actions: ['Profile', 'Taxes', 'Benefits', 'Payments', 'Logs', 'Others'],
    };
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
.main-wrapper {
  display: flex;
  align-items: center;
  padding-top: 50px;
  padding-left: 50px;
}

.actions-wrapper {
  display: flex;
  flex-wrap: wrap;
  margin-left: 100px;
}

.action-card {
  flex: 0 0 33.333333%;
  margin: 30px 0;
}

.action-title {
  font-size: 30px;
  margin: auto;
  color: red;
}
</style>
