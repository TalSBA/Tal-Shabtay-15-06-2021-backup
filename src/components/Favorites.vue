<template>
  <b-container class="city-card" >
    <b-row v-if="$store.state.favorites">
      <city-card v-for="city in favorites" :key="city.name" :city="city"></city-card>
    </b-row>
  </b-container>
</template>

<script>
import CityCard from "./CityCard.vue";
import { mapGetters } from "vuex";

export default {
  components: {
    cityCard: CityCard,
  },
  data(){
      return{
      }
  },
  computed:{
    ...mapGetters(['favorites'])
  }
};
</script>

<style>
.city-card .card {
  margin: 20px;
  text-align: center;
}
</style>