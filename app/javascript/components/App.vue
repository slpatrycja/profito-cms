<template>
  <div class="content-wrapper">
    <v-container>
      <v-navigation-drawer permanent
        v-model="drawer"
        color="#009688"
        absolute
        dark
        >

        <v-list-item two-line>
          <v-list-item-avatar height="100px" width="100px">
            <img src="../assets/images/profito-logo.png" class="logo">
          </v-list-item-avatar>
          <v-list-item-content>
            <v-list-item-title class="app-title">
              ProfitoCMS
            </v-list-item-title>
          </v-list-item-content>
        </v-list-item>

        <v-divider></v-divider>

        <v-list dense nav>
          <v-list-item
            v-for="item in items"
            :key="item.title"
            link
          >
            <v-list-item-icon>
              <v-icon>{{ item.icon }}</v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title>{{ item.title }}</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>

      </v-navigation-drawer>
      <router-view />
    </v-container>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        drawer: true,
        items: [
          { title: 'Dashboard', icon: 'mdi-view-dashboard' },
          { title: 'Photos', icon: 'mdi-image' },
          { title: 'About', icon: 'mdi-help-box' },
        ],
      }
    },
  }
</script>

<style lang="scss" scoped>
.logo {
  transform: scale(1.5);
}

.app-title {
  margin: 10px;
}
</style>
