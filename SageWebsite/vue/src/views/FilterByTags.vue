<template>
  <div class="explore">
    <h3>Explore Recipes</h3>
    <div class="borderbox"></div>
    <!-- <div id="search">
      <input
        type="text"
        placeholder="Search by keyword..."
        id="searchbox"
        v-model="search"
      />
      <router-link v-bind:to="{ name: 'search', params: { keyword: search } }"
        ><button id="search-button" v-on:click="setKeyword">
          Search
        </button></router-link
      >
     
    </div> -->
    <div id="explore">
      <router-link  v-bind:to="{name:'explore-recipes'}">
      <button id="explore-button" >Back to Explore Recipes</button></router-link>
    </div>

    <!-- <div id="tags-filter">
      <router-link
        v-bind:to="{ name: 'filter-by-tag', params: { id: tag.tagId } }"
        v-for="tag in $store.state.tags"
        v-bind:key="tag.tagId"
        v-bind:value="tag.tag"
        ><button v-on:click="setCurrentTag(tag.tagId, tag.tag)">
          {{ tag.tag }}
        </button></router-link
      >
    </div> -->
    <div id="tags-filter">
      <p>
        Showing all recipes that are {{ $store.state.selectedTag }} | Showing
        {{
          $store.state.filteredList === []
            ? "0"
            : $store.state.filteredList.length
        }}
        {{ $store.state.filteredList.length == 1 ? "result" : "results" }}
      </p>
    </div>
    <div class="cardsContainer">
      <RecipeCard
        v-for="recipe in $store.state.filteredList"
        :key="recipe.recipeId"
        :recipe="recipe"
      />
    </div>
  </div>
</template>

<script>
import RecipeCard from "../components/RecipeCard.vue";
import APIService from "../services/APIService.js";

export default {
  name: "ExploreRecipes",
  data(){
    return{
      results:[],
      search:'',
      tagId:0,
    }
  },
  components: { RecipeCard },
  created() {
    APIService.getRecipes().then((response) => {
      this.$store.commit("SET_RECIPES", response.data);
          });
    APIService.getTags().then(response=>{
      this.$store.commit('SET_TAGS', response.data)
    }
    );
    APIService.getRecipesByTagId(this.$store.state.selectedTagId)
        .then((response)=>
            this.$store.commit("SET_FILTERED", response.data)
        );
  },
 methods:{
    setKeyword(){
      this.$store.commit("SET_KEYWORD", this.search);
    },
    setCurrentTag(tagId, tag){
      this.$store.commit("SET_SELECTED_TAG",tag)
      this.$store.commit("SET_SELECTED_TAG_ID", tagId)
    },
    // filterByTag(){
    //   this.$store.commit("SET_FILTERED", results)
    // }
    
   
  },
  computed:{
    
    
  }
};
</script>

<style scoped>
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

.cardsContainer {
  margin: 2rem;
  position: relative;
  display: flex;
  flex-wrap: wrap;
  gap: 0.3rem;
  justify-content: center;
}

input {
  background: #fff;
  border: 1px #333 solid;
}
#search {
  display: flex;
  justify-content: center;
  margin-top: 20px;
  align-content: center;
}

#searchbox {
  width: 40rem;
  height: 2rem;
}

#search-button {
  margin-left: 10px;
  margin-top: 0px;
}

#tags-filter {
  display: flex;
  justify-content: center;
  flex-wrap: wrap;
}

#tags-filter button {
  margin: 0.5rem;
  margin-top: 1.5rem;
}

p {
  font-family: "Montserrat";
  font-style: italic;
}

#explore{
  display: flex;
  justify-content: center;
  margin-bottom: 2rem;
}
</style>