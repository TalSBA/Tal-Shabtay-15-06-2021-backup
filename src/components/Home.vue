<template>
  <div>
    <search-bar></search-bar>
    <weather-details></weather-details>
  </div>
</template>

<script>
import SearchBar from "./SearchBar.vue";
import WeatherDetails from "./WeatherDetails.vue";

export default {
  components: {
    searchBar: SearchBar,
    weatherDetails: WeatherDetails
  },
  data() {
    return {
      friends: [
        {
          id: "manual",
          name: "Menual Lorenz",
          phone: "2304234",
          email: "manual@gmail.com",
        },
        {
          id: "tal",
          name: "tal Lorenz",
          phone: "2304234",
          email: "tal@gmail.com",
        },
      ],
    };
  },
};
</script>

<style>
</style>
