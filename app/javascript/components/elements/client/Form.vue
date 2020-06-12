<template>
  <div class="client-form">
    <div class="p-row">
      <v-text-field
        v-model="client.name"
        label="Name"
        class="p-col-md-2 client-form-input"
        required
      />
      <v-text-field
        v-model="client.surname"
        label="Surname"
        class="p-col-md-2 client-form-input"
        required
      />
    </div>
    <div class="p-row">
      <v-text-field
        v-model="client.email"
        label="Email"
        class="p-col-md-2 client-form-input"
        required
      />
      <v-text-field
        v-model="client.pesel"
        class="p-col-md-2 client-form-input"
        label="PESEL"
        required
      />
    </div>
    <div class="p-row">
      <v-menu
        :close-on-content-click="false"
        :nudge-right="40"
        transition="scale-transition"
        offset-y
        min-width="290px"
      >
        <template v-slot:activator="{ on }">
          <v-text-field
            v-model="client.birthDate"
            label="Birth date"
            class="p-col-md-2 client-form-input"
            readonly
            v-on="on"
          ></v-text-field>
        </template>
        <v-date-picker v-model="client.birthDate"></v-date-picker>
      </v-menu>

      <v-text-field
        v-model="client.telephone"
        class="p-col-md-2 client-form-input"
        label="Telephone"
      />
    </div>
    <div class="p-row">
      <v-text-field
        v-model="client.country"
        class="p-col-md-2 client-form-input"
        label="Country"
      />
      <v-text-field
        v-model="client.postalName"
        class="p-col-md-2 client-form-input"
        label="Postal name"
      />
    </div>
    <div class="p-row">
      <v-text-field
        v-model="client.postalCode"
        class="p-col-md-2 client-form-input"
        label="Postal code"
      />
      <v-select
        :items="voivodeships"
        label="Voivodeship"
        v-model="client.voivodeship"
        class="p-col-md-2 client-form-input"
      ></v-select>
    </div>
    <div class="p-row">
      <v-text-field
        v-model="client.city"
        class="p-col-md-2 client-form-input"
        label="City"
      />
      <v-text-field
        v-model="client.street"
        class="p-col-md-2 client-form-input"
        label="Street"
      />
    </div>
    <div class="p-row">
      <v-text-field
        v-model="client.idnrDe"
        class="p-col-md-2 client-form-input"
        label="IDNR DE"
      />
      <v-text-field
        v-model="client.idnrNl"
        class="p-col-md-2 client-form-input"
        label="IDNR NL"
      />
    </div>
    <div class="p-row">
      <v-text-field
        v-model="client.idnrBe"
        class="p-col-md-2 client-form-input"
        label="IDNR BE"
      />
      <v-text-field
        v-model="client.idnrAt"
        class="p-col-md-2 client-form-input"
        label="IDNR AT"
      />
    </div>

    <div class="p-row">
      <v-text-field
        v-model="client.steuernummer"
        class="p-col-md-2 client-form-input"
        label="Steuernummer"
      />
    </div>

    <div class="p-row">
      <v-btn large color="primary" class="btn-save" @click.native="save">Save</v-btn>
    </div>
  </div>
</template>

<script>
const POLISH_VOIVODESHIPS = [
  'dolnośląskie',
  'kujawsko-pomorskie',
  'lubelskie',
  'lubuskie',
  'łódzkie',
  'małopolskie',
  'mazowieckie',
  'opolskie',
  'podkarpackie',
  'podlaskie',
  'pomorskie',
  'śląskie',
  'świętokrzyskie',
  'warmińsko-mazurskie',
  'wielkopolskie',
  'zachodniopomorskie',
];

export default {
  name: 'client-form',
  props: {
    client: { type: Object, default: function () { return {} } },
    editing: { type: Boolean, default: false },
  },
  computed: {
    voivodeships() {
      return POLISH_VOIVODESHIPS;
    },
  },
  methods: {
    save() {
      if (this.editing) {
        this.$store.dispatch('clients/update', this.client);
      } else {
        this.$store.dispatch('clients/create', this.client);
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
  display: flex;
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
</style>
