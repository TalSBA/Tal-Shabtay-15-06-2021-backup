<template>
  <b-card :title="city.name" style="max-width: 20rem" class="mb-2">
    <b-card-text> {{city.temperature}} </b-card-text>
    <b-card-text> {{city.weatherText}} </b-card-text>
  </b-card>
</template>

<script>
export default {
  props: ["city"],
};
</script>