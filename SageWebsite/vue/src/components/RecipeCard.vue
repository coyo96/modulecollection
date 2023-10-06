<template>
  <div class="cardBody">
    <div class="name-img-container">
      
         <!-- Use the <favorite> component to toggle favorited state -->
        <FavoriteIcon :recipe="recipe" v-bind:value="recipe"
         @toggle-favorites="handleToggleFavorites" :class="{favorite:recipe.favorite, notFavorite: !recipe.favorite}" />

      <router-link
        v-bind:to="{ name: 'recipe', params: { id: recipe.recipeId } }"
        >
        <img :src="recipe.imgUrl" class="image-fit"
      />
      </router-link>
      
      <div class="title-servings-combo">
        <h3>
          <router-link
            v-bind:to="{ name: 'recipe', params: { id: recipe.recipeId } }"
            >{{ recipe.recipeName }}</router-link
          >
        </h3>
        <h3 v-on:click.prevent="pleaseLogin">
          <router-link
            v-bind:to="{ name: 'recipe', params: { id: recipe.recipeId } }"
            >{{ recipe.recipeName }}</router-link
          >
        </h3>
        <div class="borderbox"></div>

        <div class="description">
          <p>{{ recipe.description }}</p>
        </div>

        <div class="servings">
          Serving Size: {{ recipe.servingSize }} 
          <!-- | Total Time:
          {{ recipe.servingSize }} -->
        </div>
        
      </div>
      
    </div>
    <!-- <div id = "addButton">
             <button v-on:click="addToFavorited(recipe)" >Add to Favorites</button>
    </div> -->

  </div>
</template>

<script>
import FavoriteIcon from './FavoriteIcon.vue';
export default {

  name: "recipeCard",
  props: { recipe: Object },
  components: {FavoriteIcon},
  methods: {
    pleaseLogin() {
      if (this.$store.state.token === "") {
        this.$router.push("/login");
      }
    },
    
    toggleFavorites() {
            this.$store.commit('FLIP_FAVORITE', this.recipe);
    },
    handleToggleFavorites() {
      // Check the class of the FavoriteIcon component
      if (this.recipe.favorite) {
        // The 'favorite' class is present, perform method A
        this.unbookmarkRecipe();
      } else {
        // The 'notFavorite' class is present, perform method B
        this.bookMarkRecipe();
      }
      // Toggle the 'favorite' property of the recipe (assuming it's a Boolean)
      this.toggleFavorites();
    },
    bookMarkRecipe(){
      this.$store.commit('ADD_TO_LIBRARY', this.recipe);
    },
    unbookmarkRecipe(){

      this.$store.commit('DELETE_FROM_LIBRARY', this.recipe.recipeId);
    }

  },
};
</script>

<style scoped>
.cardBody {
  /* will-change: transform, opacity; */

  filter: saturate(1);
  transition: all ease-in-out 2s;
}
.image-fit {
  border: 2px solid rgba(158, 125, 125, 0.747);
  height: 30rem;
  width: 20rem;
  object-fit: cover;
  border-radius: 6px;
  margin: 1rem 2rem;
}

.name-img-container {
  position: relative;
 
}

.notFavorite {
border:none;

  padding: 6px 4px;
position: fixed;
transform: scale(1.6);
right: 12%;
top: 1%;
background: rgb(236, 236, 236); 
backdrop-filter: opacity(.5);

transition: .3s ease;
}


.favorite{
border:none;
  padding: 6px 4px;
position: fixed;
transform: scale(1.6);
right: 12%;
top: 1%;
background: rgb(236, 236, 236); 
backdrop-filter: opacity(.5);

transition: .3s ease;
}

.favorite:hover{
  transform: scale(1.6);
}


.name-img-container:hover {
  -webkit-transform: scale(1.1);
  -moz-transform: scale(1.1);
  transform: scale(1.1);
  filter: saturate(1.2);
  transition: all ease-in-out 0.5s;
}

.title-servings-combo {
  position: absolute;
  top: 67%;
  left: 34px;
  border-radius: 0px 0px 3px 3px;
  width: 20rem;
  height: 8rem;
  object-fit: contain;
  background: #fffdfbe0;
  overflow: hidden;
}
.title-servings-combo a {
  color: #333;
  text-decoration: none;
}
.borderbox {
  top: 30px;
  border-bottom: 7px solid #55695659;
  margin: 10px 0px;
  position: relative;
  left: 0;

  width: 30rem;
}

h3 {
  position: absolute;
  top: -15%;
  left: 3%;
  font-size: 1.5rem;
}

.description {
  position: absolute;
  padding: 2%;
  margin-top: 0px;
  top: 20%;
  object-fit: contain;
}

.servings {
  color: rgba(100, 66, 15, 0.664);
  font-weight: bold;
  position: absolute;
  right: 3%;
  top: 80%;
}

#addButton{
  display: flex;
  justify-content: center;
}
</style>