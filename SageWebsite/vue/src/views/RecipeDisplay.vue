<template>
  <div class="recipe-details"> 
      <recipe-details v-bind:recipe="recipeDetails" @showStep="stepByStep=true"/>
      <Steps v-if="stepByStep" @hideStep="stepByStep=false" />
      
  </div>
</template>

<script>
import RecipeDetails from "../components/RecipeDetail.vue"
import APIService from "../services/APIService.js";
import Steps from '../views/Steps.vue'
export default {
    components:{RecipeDetails, Steps},
    data(){
        return{
            stepByStep:false,
        }
    },
    computed:{
        recipeDetails(){
            let someRecipe= this.$store.state.recipes.find((recipe) => {
                return recipe.recipeId == this.$route.params.id})
                ;
                return someRecipe;
        }
    },
     created(){
        APIService.getRecipes().then((response) => {
            this.$store.commit("SET_RECIPES", response.data);
          });
     }


}
</script>

<style scoped>
    .recipe-details{
        display: flex;
        justify-content: center;
    }

</style>