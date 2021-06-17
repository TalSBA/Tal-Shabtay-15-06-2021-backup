<template>
  <router-link to="/home" activeClass="active" tag="li" :city="city">
    <b-col>
      <b-card v-if="city" class="favorite-card">
        <b-icon
          class="favorite-icon"
          id="favorite"
          :icon="icon"
          @click="handleFavorites"
        ></b-icon>
        <b-card-title>{{ city.LocalizedName }}</b-card-title>
        <b-card-text> {{ cityDetails.Temperature.Metric.Value }} </b-card-text>
        <b-card-img :src="imgSrc" :alt="cityDetails.WeatherIcon"></b-card-img>
      </b-card>
    </b-col>
  </router-link>
</template>

<script>
import { mapGetters } from "vuex";
import { getCityDetails } from "../services";

export default {
  props: ["city"],
  data() {
    return {
      imgSrc: null,
      cityDetails: null,
    };
  },
  async created() {
    this.cityDetails = await getCityDetails(this.city);
    console.log("city card ", this.city);
    this.imgSrc = require("../assets/weather/" +
      this.cityDetails.WeatherIcon +
      ".png");
  },
  methods: {
    handleFavorites() {
      if (this.favoriteExist) {
        this.removeFromFavorites();
      } else {
        this.addToFavorites();
      }
    },
    addToFavorites() {
      this.$store.dispatch("addTofavorites", {
        Key: this.city.Key,
        LocalizedName: this.city.LocalizedName,
      });
    },
    removeFromFavorites() {
      this.$store.dispatch("deleteFromFavorites", this.city.Key);
    },
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
        this.favorites.find((city) => city.Key === this.city.Key)
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
.favorite-card {
  cursor: pointer;
}

.favorite-card img {
  width: 85px;
  height: 55px;
}
</style>