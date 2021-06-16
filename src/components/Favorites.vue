<template>
  <b-container class="city-card">
    <b-row>
      <city-card></city-card>
      <city-card></city-card>
      <city-card></city-card>
      <city-card></city-card>
      <city-card></city-card>
      <city-card></city-card>
    </b-row>
  </b-container>
</template>

<script>
import CityCard from "./CityCard.vue";

export default {
  components: {
    cityCard: CityCard,
  },
  setup() {},
};
</script>

<style>
.city-card .card {
  margin: 20px;
  text-align: center;
}
</style>