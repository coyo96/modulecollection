<template>
  <div class="home title-servings-combo">
    <div id="top">

      <!-- Added Font Awesome Icon-->
      <!-- <i class="fa-solid fa-leaf" style="font-size: 1.5em;color: green;"></i> -->
      
      <h2 id="welcome">Welcome{{$store.state.token != ''? ", " + $store.state.user.username : " to Sage"}}!</h2>
      </div>
      <div >
        <div class="buttons"> 
      <router-link  v-bind:to="{name:'login'}" ><button id="login"  v-if="$store.state.token == ''">Login</button></router-link>
    
      <router-link  v-bind:to="{name:'explore-recipes'}" ><button id="explore-button" >Explore Recipes</button></router-link>
  </div>
</div>
    <h3>Featured Recipes</h3>
    
  <div id="recipeCardContainer">

    <RecipeCard
      v-for="recipe in $store.state.recipes"
      v-bind:key="recipe.recipeId"
      v-bind:recipe ="recipe"
     /> 
  </div>
    
  </div>
</template>

<script>
import APIService from '../services/APIService.js';
import RecipeCard from '../components/RecipeCard.vue';
export default {
  components: { RecipeCard },
  name: "home",
  method:{
    loginPage(){
      this.$router.push("login");
    }
  },
  created(){
    APIService.getRecipesByFeatured().then(response=>{
      this.$store.commit('SET_RECIPES', response.data)
    })
  },
  computed:{
     recipe(){
      
      return this.$store.state.featuredList;
    },
  }
};
</script>

<style scoped>
.home{
  width: 100%;
}

.container{
  background-color:transparent;
  font-family: "Montserrat";
  margin:auto;
  display: flex;
  align-items: center;
  flex-wrap: wrap;
  flex-direction: row;
  width: 100vw;

}

.buttons{
  display:flex;
  flex-direction: column;

  align-items: center;
  position: relative;
  margin-bottom: 1rem;

}


#welcome{
  text-align: center;
  font-size: 5rem;
  background: rgb(161, 136, 96);
  color: #fff;
  opacity: 30%;
  width: 100vw;
  padding: 2% 0%;
  margin-bottom: 2rem;
} 

button{
  width:25%;
  height: 10%;;
  font-family: "Montserrat";
  font-size: 1.5rem;
  border: 1px solid rgba(51, 51, 51, 0.527);
  border-radius: 2px;
  background-color: #81cf81;
  width: 15rem;
  margin: .5rem 0rem;
  padding: .5rem;
}

button a{
  color: rgba(255, 255, 255, 0.952);
}
button:nth-child(odd){
  color:  #90af90;
  background: rgba(70, 139, 45, 0.849);
  text-decoration: none;
  
}
button:hover{
 background: rgba(231, 217, 92, 0.466);
 transition: .3s ease;
}

#recipeCardContainer{
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
}

#title{
  display: flex;
  justify-content: center;
  text-align: center;
  background-color:transparent ;
}

#recipe-card-container{
  display: flex;
  justify-content: center;
  text-align: left;
}

p{
  font-family: "Montserrat";
  font-style: italic;
}

input{
  background: #fff;
  border: 1px #333 solid;
  margin-right: 1rem;
}

#explore{
  display: flex;
  justify-content: center;
}

#login,
#explore-button{
  color: #fff;
}

h3{
  text-align: center;
}



</style>
