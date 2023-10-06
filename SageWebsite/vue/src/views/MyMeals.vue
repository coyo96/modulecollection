<template>
  <div class="cardsContainer">
    <h3>My Meal Plans</h3>
    <div class="borderbox"></div>

    <div class="form-btn">   
     <button v-on:click="showForm = !showForm">
        {{ showForm ? "Hide Form" : "Add a New Meal Plan" }}
      </button>    
    </div>

    <div class="form-container" v-if="showForm">
         <NewMealPlan/>
    </div>

    <div class="mealCards">
      <MealPlanCard />
      <MealPlanCard />
      <MealPlanCard />
    </div>

  </div>
</template>

<script>
import MealPlanCard from "../components/MealPlanCard.vue";
import NewMealPlan from '../components/NewMealPlan.vue';

export default {
  name: "MyMeals",
  components: {
    NewMealPlan,
    MealPlanCard,
  },

  data() {
    return {
      showForm: false,
    };
  },

};
</script>

<style scoped>
.form-btn {
  display: flex;
  position: relative;
  justify-content: center;
  margin: auto;
  margin-top: -3rem;
}

.mealCards {
  display: flex;
  justify-content: center;
}

h3 {
  text-align: center;
  text-decoration: none;
  font-size: 2.5rem;
  margin: 1rem 0;
}
.mealCards {
  margin-top: 3rem;
  display: flex;
  flex-wrap: wrap;
  position: relative;
  gap: 0.3rem;
  justify-content: center;
  overflow:hidden;
}

.borderbox {
  width: 50%;
  position: relative;
  left: 25%;
  margin-bottom: 3rem;
}

.cardsContainer {
  position: relative;
}

.form-container{
  display: flex;
  justify-content: center;
}

</style>