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
  props: ["city"],
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
  async created() {
    console.log('city props', this.city);
    if (this.city) {
      await this.onSearchChanged(this.city.LocalizedName);
      await this.getCity({
        LocalizedName: this.city.LocalizedName,
        Key: this.city.Key,
      });
    } else {
      await this.onSearchChanged("Tel Aviv");
      await this.getCity({
        LocalizedName: "Tel Aviv",
        Key: "215854",
      });
    }
  },
  methods: {
    async onSearchChanged(value) {
      if (value) this.citiesResults = await getCities(value);
    },
    async getCity(cityResult) {
      this.citiesResults = null;
      this.selectedCity = cityResult;
      console.log("result clicked", cityResult);
      this.weatherDetailsResult = await getCityDetails(cityResult);
      this.fiveDaysWeatherResult = await getFiveDaysWeather(cityResult.Key);
    },
  },
};
</script>

<style>
</style>
