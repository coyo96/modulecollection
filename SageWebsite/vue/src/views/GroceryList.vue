<template>
  <div class="grocery">
    <FoodList/>
  </div>  
</template>

<script>
import FoodList from '../components/FoodList.vue';

export default {
  name: "My-Meals",
  components: {FoodList},
};
</script>

<style scoped>
.grocery{

}
h3 {
  text-align: center;
  text-decoration: none;
  font-size: 2.5rem;
}
.borderbox {
  width: 50%;
  position: relative;
  left: 25%;
}
.grocery{
  padding-bottom: 2.9rem;
}
</style>