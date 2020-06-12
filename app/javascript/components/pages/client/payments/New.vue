<template>
  <div class="client-form">
    <div class="p-row">
      <v-text-field
        v-model="payment.value"
        label="Value"
        type="number"
        class="p-col-md-2 client-form-input"
        required
      />
    </div>

    <div class="p-row">
      <v-btn large color="primary" class="btn-save" @click.native="save">Save</v-btn>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    clientId: { type: [String, Number], required: true },
  },
  data() {
    return {
      payment: {
        clientId: this.clientId,
        value: null,
      },
    };
  },
  methods: {
    async save() {
      try {
        await this.$store.dispatch('payments/create', this.payment);

        this.$router.push({ name: 'client-payments', params: { clientId: this.clientId }});
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
