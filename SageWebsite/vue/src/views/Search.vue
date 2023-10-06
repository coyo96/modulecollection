<template>
  <div class="search">

    <div id="title">
    <h2>Searching for recipes...</h2>
    </div>
    <!-- <div id= "search-box">
     <input type="text" placeholder="Search by keyword..." id = "searchbox" v-model="search"/>
    <router-link v-bind:to="{ name: 'search', queryParams:{keyword:search}}"><button id="search-button"  v-on:click="setKeyword">Search</button></router-link>
    </div> -->
    <div id="explore">
    <router-link  v-bind:to="{name:'explore-recipes'}">
      <button id="explore-button" >Back to Explore Recipes</button></router-link>
    </div>

    <p>Search results for "{{ $store.state.keyword }}" | Showing {{$store.state.keyword =="" ? 0 : $store.state.filteredList.length}} {{$store.state.filteredList.length == 1 ? 'result' : 'results'}}</p>
  


    <div v-if="$store.state.keyword !== '' && $store.state.filteredList.length > 0" id="recipe-card-container">
  <RecipeCard
    v-for="recipe in $store.state.filteredList"
    :key="recipe.recipeId"
    :recipe="recipe"
  />
</div>
<div v-else>
  <p>No results found.</p>
</div>
  </div>
</template>

<script>
import APIService from "../services/APIService.js";
import RecipeCard from "../components/RecipeCard.vue";

export default {
  components: { RecipeCard },
  data() {
    return {
      search:"",
      results: [],
      resultNumber: 0,
    };
  },
  created() {
    let searchWord = this.$store.state.keyword;
    APIService.getRecipes().then((response) => {
      this.$store.commit("SET_RECIPES", response.data);
          });

    APIService.getRecipesByKeyword(searchWord).then((response) => {
      this.$store.commit("SET_FILTERED", response.data);
      this.results = this.$store.state.filteredList;
      this.resultsNumber = this.$store.state.filteredList.length;
    });
    // APIService.getRecipesByTagId(this.$route.params.id)
    //     .then((response)=>{
    //        this.$store.commit("SET_FILTERED", response.)data;

    //     }
           
    //     );

 
  },

  methods: {
    setKeyword(){
      this.$store.commit("SET_KEYWORD", this.search); 
      
    }
  },
  
  computed: {
    numberOfResults() {
      return this.resultsNumber;
    },
    
  },
};
</script>

<style scoped>

h2{
  text-align: center;
  background: transparent;
}
.search{
  text-align: center;
}
.search-box{
  display: flex;
  justify-content: center;
}

#searchbox{
  width: 40rem;
  height: 2rem;
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
</style>