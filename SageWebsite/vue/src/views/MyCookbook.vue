<template>

 <div class="cardsContainer">
    <h3>My Cookbook<br>    </h3>
    


<div class="borderbox"></div>
<div class="form-btn">
   <button v-on:click="showForm=!showForm" >{{showForm? "Hide Form" : "Add Recipe"}}</button>
</div>
<div id ="form-container">
<NewRecipeForm v-if="showForm===true"/>
</div>
 <div>
<div id="createdRecipes">
</div>
 
  
  
<h2 id="createdRecipes"> Created Recipes</h2>

    <div class="recipesList">
     <RecipeCard
      v-for="recipe in myRecipes"
      v-bind:key="recipe.recipeId"
      v-bind:recipe ="recipe"
     /> 
    </div>
 </div>
 <div id ="favoritedRecipes">
   <h2 id="bookmaredRecipes" >My Bookmarked Recipes <i class="fa-solid fa-bookmark"></i><br>    </h2>
   <div class = "recipesList">
     <RecipeCard
      v-for="recipe in $store.state.favoritedLibrary"
      v-bind:key="recipe.recipeId"
      v-bind:recipe ="recipe"
     /> 
   </div>
 </div>
 </div>
</template>

<script>
import RecipeCard from "../components/RecipeCard.vue";
import NewRecipeForm from '../components/NewRecipeForm.vue';
import APIService from '../services/APIService.js';


export default {
  name: "my-cookbook",
  data(){
    return{
      showForm:false
    }
  },
  components: { RecipeCard, NewRecipeForm },
  computed: {
    myRecipes() {
      return this.$store.state.recipes.filter((recipe) => {
        return recipe.creatorId == this.$store.state.user.id;
      });
    },
  },
  created(){
    APIService.getRecipes().then(response => {
      this.$store.commit('SET_RECIPES', response.data)
    });
  }
};
</script>

<style scoped>

.recipesList {
 margin-top: 3rem;
  display: flex; 
  flex-wrap: wrap;
  position: relative;
  gap: .3rem;
 justify-content: center;
}


h3{
text-align: center;
font-size: 2.5rem;
}

.form-btn{
  display: flex;
position: relative;
justify-content: center;
  margin: auto;
}

.borderbox{
  width: 50%;
  position: relative;
 left: 25%;

}
#form-container{
  display: flex;
  justify-content: center;
}

h2{
  text-align:center
}

#createdRecipes{
  margin-top: 3rem;
  
}



</style>