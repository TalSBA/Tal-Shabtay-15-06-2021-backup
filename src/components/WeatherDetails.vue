<template>
  <div class="weather-details">
    <b-row>
      <b-col>
        <img
          src="https://mfa.gov.il/MFA/IsraelExperience/Experience2016/TLVBrinker-Coastline.jpg"
        />
        <div class="city-celsius">
          <p>Tel Aviv</p>
          <p>23`c</p>
        </div>
      </b-col>
      <b-col>
        <b-icon
          class="favorite-icon"
          id="favorite"
          icon="star"
          aria-hidden="true"
        ></b-icon>
        <b-tooltip target="favorite" triggers="hover"
          >Add to favorites</b-tooltip
        >
      </b-col>
    </b-row>
    <b-row>
      <b-col>
        <h1>Scattered Clouds</h1>
      </b-col>
    </b-row>
    <b-row class="days">
      <b-col><day-degrees></day-degrees></b-col>
      <b-col><day-degrees></day-degrees></b-col>
      <b-col><day-degrees></day-degrees></b-col>
      <b-col><day-degrees></day-degrees></b-col>
      <b-col><day-degrees></day-degrees></b-col>
    </b-row>
  </div>
</template>

<script>
import DayDegrees from "./DayDegreesCard.vue";

export default {
  components: {
    dayDegrees: DayDegrees,
  },
  setup() {},
};
</script>

<style>
.weather-details {
  margin-top: 80px;
  text-align: center;
}

.weather-details .row {
  margin-top: 40px;
}
.weather-details img {
  width: 100px;
  height: 100px;
}
.weather-details .city-celsius {
  padding: 10px;
  display: inline-block;
}

.weather-details .city-celsius p {
  margin: 0;
}

.weather-details .favorite-icon {
  font-size: 40px;
  color: rgb(255, 166, 0);
  cursor: pointer;
}
.weather-details .days {
  width: 1000px;
  margin: 0 auto;
  margin-top: 80px;
}
</style>