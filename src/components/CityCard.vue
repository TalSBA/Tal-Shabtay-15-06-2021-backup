<template>
  <b-card>
    <b-icon class="favorite-icon" id="favorite" :icon="icon"></b-icon>
    <b-card-title>{{ city.name }}</b-card-title>
    <b-card-text> {{ city.temperature }} </b-card-text>
    <b-card-img :src="imgSrc" :alt="city.weatherIcon"></b-card-img>
  </b-card>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  props: ["city"],
  data() {
    return {
      imgSrc: require("../assets/weather/" + this.city.weatherIcon + ".png"),
    };
  },
  computed: {
    ...mapGetters(["favorites"]),
    icon() {
      if (this.favoriteExist) {
        return "star-fill";
      } else {
        return "star";
      }
    },
    favoriteExist() {
      return (
        this.favorites &&
        this.favorites.find((city) => city.name === this.city.LocalizedName)
      );
    },
  },
};
</script>

<style>
.favorite-icon {
  font-size: 20px;
  color: rgb(255, 166, 0) !important;
  cursor: pointer;
}
</style>