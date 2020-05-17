<template>
  <div class="content-wrapper">
    <v-app>
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
                <v-list-item-title>
                  <router-link class="nav-link" :to="{ name: item.linkName }">{{ item.title }}</router-link>
                </v-list-item-title>
              </v-list-item-content>
            </v-list-item>
          </v-list>

        </v-navigation-drawer>
      </v-container>
      <router-view class="router-view-wrapper"/>
    </v-app>
  </div>
</template>

<script>
  export default {
    data () {
      return {
        drawer: true,
        items: [
          { title: 'Clients', linkName: 'clients', icon: 'mdi-view-dashboard' },
          { title: 'Shipments', icon: 'mdi-image' },
          { title: 'Admin', icon: 'mdi-help-box' },
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

.nav-link {
  color: white;
}

.router-view-wrapper {
  margin-left: 256px;
  width: 75vw;
}
</style>
