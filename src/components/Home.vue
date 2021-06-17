<template>
  <div>
    <search-bar
      :cities="citiesResults"
      @on-search="onSearchChanged"
      @on-city-selected="getCity"
    ></search-bar>
    <weather-details
      v-if="selectedCity && weatherDetailsResult && fiveDaysWeatherResult"
      :city="selectedCity"
      :details="weatherDetailsResult"
      :five-days-weather-result="fiveDaysWeatherResult"
    ></weather-details>
  </div>
</template>

<script>
import SearchBar from "./SearchBar.vue";
import WeatherDetails from "./WeatherDetails.vue";
import { getCities, getCityDetails, getFiveDaysWeather } from "../services";

export default {
  components: {
    searchBar: SearchBar,
    weatherDetails: WeatherDetails,
  },
  data() {
    return {
      citiesResults: null,
      selectedCity: null,
      weatherDetailsResult: null,
      fiveDaysWeatherResult: null,
    };
  },
  created() {
    this.onSearchChanged("Tel Aviv");
    this.getCity({
      LocalizedName: "Tel Aviv",
      Key: "215854",
    });
  },
  methods: {
    onSearchChanged(value) {
      this.citiesResults = getCities(value);
    },
    getCity(cityResult) {
      this.citiesResults = null;
      this.selectedCity = cityResult;
      console.log("result clicked", cityResult);
      this.weatherDetailsResult = getCityDetails(cityResult);
      this.fiveDaysWeatherResult = getFiveDaysWeather(cityResult.Key);
    },
  },
};
</script>

<style>
</style>
