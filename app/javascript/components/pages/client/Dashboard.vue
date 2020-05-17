<template>
  <div v-if="isLoaded" class="main-wrapper">
    <div class="actions-wrapper">
      <div v-for="action in actions" class="p-col-md-3 action-card-wrapper">
        <v-card
          class="d-flex align-center action-card"
          :class="`action-card-${action.toLowerCase()}`"
          height="250"
          width="250"
          @click="toggle">
          <img class="action-image":src="iconUrl(action.toLowerCase())">
          <span class="action-title">{{ action }}</span>
        </v-card>
      </div>
    </div>
  </div>
</template>

<script>
import { mapState } from 'vuex';
const svgIcons = require.context('../../../assets/images/icons', false, /\.png/);

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
    iconUrl(action) {
      return svgIcons(`./${action}.png`);
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

.action-card-wrapper {
  flex: 0 0 33.333333%;
  margin: 30px 0;
}

.action-title {
  margin: auto;
  color: #409688;
  font-size: 25px;
  margin-top: 60%;
}

.theme--light.v-card {
  border-radius: 10px;
  background: #fff;
  cursor: pointer;
  border-radius: 15px !important;
}

.action-image {
  width: 80px;
  position: absolute;
  left: 35%;
  top: 25%;
  height: 80px;
}
</style>
