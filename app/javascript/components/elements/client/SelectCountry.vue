<template>
  <div class="main-wrapper">
    <div class="actions-wrapper">
      <div v-for="country in countries" class="p-col-md-3 action-card-wrapper">
        <router-link :to="{ name: `client-${type}`, params: { clientId, country: country } }">
          <v-card
            class="d-flex align-center action-card"
            height="250"
            width="250">
            <img class="action-image":src="iconUrl(country)">

            <span class="action-title">{{ $i18n.t(`countries.${country}`) }}</span>
          </v-card>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
const svgIcons = require.context('../../../assets/images/icons', false, /\.png/);

export default {
  name: 'select-country',
  props: {
    clientId: { type: [String, Number], required: true },
    type: { type: [String], required: true }
  },
  data() {
    return {
      countries: ['pl', 'de', 'nl', 'be', 'at'],
    };
  },
  methods: {
    iconUrl(country) {
      return svgIcons(`./${country}.png`);
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
  margin-left: calc(10%);
  margin-top: calc(5%);

  a:hover {
    text-decoration: none;
  }
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
