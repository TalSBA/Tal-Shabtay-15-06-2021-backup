<template>
  <div>
    <menu-bar></menu-bar>
    <router-view></router-view>
  </div>
</template>

<script>
import Home from "./components/Home.vue";
import Favorites from "./components/Favorites.vue";
import Menu from "./components/Menu.vue";

export default {
  components: {
    menuBar: Menu,
    homePage: Home,
    favoritesPage: Favorites,
  },
};
</script>

<style>
</style>
 