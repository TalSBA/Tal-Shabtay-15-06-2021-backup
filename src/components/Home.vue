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
import cities from "../data/cities.json";
import weatherDetailsJson from "../data/weatherDetails.json";
import fiveDaysWeatherJson from "../data/fiveDaysWeather.json";

import axios from "axios";

export default {
  components: {
    searchBar: SearchBar,
    weatherDetails: WeatherDetails,
  },
  data() {
    return {
      citiesResults: null,
      //   selectedCity: cities[0],
      //   weatherDetailsResult: weatherDetailsJson[0],
      //   fiveDaysWeatherResult: fiveDaysWeatherJson[0],

      selectedCity: null,
      weatherDetailsResult: null,
      fiveDaysWeatherResult: null,
    };
  },
  created() {
    this.onSearchChanged("Tel Aviv");
    this.getCity({ LocalizedName: "Tel Aviv", Key: "215854" });
  },
  methods: {
    onSearchChanged(value) {
      console.log("value", value);
      const newCities = cities.filter(
        (cityObj) =>
          value &&
          cityObj.LocalizedName.toLowerCase().includes(value.toLowerCase())
      );
      this.citiesResults = newCities;

      //   axios
      //     .get(
      //       `http://dataservice.accuweather.com/locations/v1/cities/autocomplete?apikey=NjkcZ7AM3eRqw4D9MjGNc7svCBY98D69&q=${value}`
      //     )
      //     .then((response) => (this.citiesResults = response.data));
    },
    getCity(cityResult) {
      this.citiesResults = null;
      this.selectedCity = cityResult.LocalizedName;
      console.log("result clicked", cityResult);
      const weatherDetails = weatherDetailsJson[1];
      this.weatherDetailsResult = weatherDetails;
      console.log(this.weatherDetailsResult);
      //   axios
      //     .get(
      //       `http://dataservice.accuweather.com/currentconditions/v1/${cityResult.Key}?apikey=NjkcZ7AM3eRqw4D9MjGNc7svCBY98D69&details=false`
      //     )
      //     .then((response) => {
      //       this.weatherDetailsResult = response.data[0];
      //       console.log(response.data[0]);
      //     });
      this.getFiveDaysWeather(cityResult.Key);
    },
    getFiveDaysWeather(cityKey) {
      this.fiveDaysWeatherResult = fiveDaysWeatherJson[1];

      //   axios
      //     .get(
      //       `http://dataservice.accuweather.com/forecasts/v1/daily/5day/${cityKey}?apikey=NjkcZ7AM3eRqw4D9MjGNc7svCBY98D69&metric=true`
      //     )
      //     .then((response) => (this.fiveDaysWeatherResult = response.data));
    },
  },
};
</script>

<style>
</style>
