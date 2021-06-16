<template>
  <div class="weather-details">
    <b-row>
      <b-col>
        <img :src="imageSrc" />
        <div class="city-celsius">
          <p>
            <strong>{{ city.LocalizedName }}</strong>
          </p>
          <p>
            {{ details.Temperature.Metric.Value }}
            <b-icon class="degrees-icon" icon="dot" aria-hidden="true"></b-icon>
            {{ details.Temperature.Metric.Unit }}
          </p>
        </div>
      </b-col>
      <b-col>
        <b-icon
          class="favorite-icon"
          id="favorite"
          icon="star"
          aria-hidden="true"
          @click="addTofavorites"
        ></b-icon>
        <b-tooltip target="favorite" triggers="hover"
          >Add to favorites</b-tooltip
        >
      </b-col>
    </b-row>
    <b-row>
      <b-col>
        <h1>{{ details.WeatherText }}</h1>
      </b-col>
    </b-row>
    <b-row class="days">
      <b-col v-for="day in fiveDaysWeatherResult.DailyForecasts" :key="day.Date"
        ><day-degrees :day="day"></day-degrees
      ></b-col>
    </b-row>
  </div>
</template>

<script>
import DayDegrees from "./DayDegreesCard.vue";

export default {
  props: ["city", "details", "five-days-weather-result"],
  components: {
    dayDegrees: DayDegrees,
  },
  data() {
    return {
      imageSrc: require("../assets/weather/" +
        this.details.WeatherIcon +
        ".png"),
    };
  },
  methods: {
    addTofavorites() {
      console.log(this.city);
      this.$store.dispatch("addTofavorites", {
        name: this.city.LocalizedName,
        temperature: this.details.Temperature.Metric.Value,
        weatherText: this.details.WeatherText,
      });
    },
  },
};
</script>

<style>
.weather-details {
  margin-top: 80px;
  text-align: center;
}

.weather-details h1,
.city-celsius {
  color: white;
}
.weather-details .row {
  margin-top: 40px;
}
.weather-details img {
  width: 85px;
  height: 55px;
}
.weather-details .city-celsius {
  padding: 10px;
  display: inline-block;
}

.weather-details .city-celsius p {
  margin: 0;
  font-size: 18px;
}

.weather-details .city-celsius p strong {
  font-size: 22px;
}

.weather-details .favorite-icon {
  font-size: 40px;
  color: rgb(255, 166, 0);
  cursor: pointer;
}
.weather-details .degrees-icon {
  vertical-align: top;
}

.weather-details .days {
  width: 1000px;
  margin: 0 auto;
  margin-top: 80px;
}
</style>