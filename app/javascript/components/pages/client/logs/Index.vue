<template>
  <div v-if="isLoaded" class="main-wrapper">
    <v-card class="main-card">
      <v-data-table
        :headers="headers"
        :loading="!isLoaded"
        :items="logs"
        :hide-default-footer="true"
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
          text: 'Description',
          align: 'start',
          value: 'description',
        },
        { text: 'Date', value: 'createdAt' },
        { text: 'Author', value: 'author' },
      ],
    };
  },
  computed: {
    ...mapState({
      logs: state => state.clientLogs.clientLogs,
    }),
    isLoaded() {
      return this.logs;
    },
  },
  created() {
    this.getLogs();
  },
  methods: {
    getLogs() {
      this.$store.dispatch('clientLogs/index', { clientId: this.clientId });
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
