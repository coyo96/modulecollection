<template>
  <div class="container">
    <div class="header-favorite-group">
         <FavoriteIcon :recipe="recipe" v-bind:value="recipe"
         @toggle-favorites="handleToggleFavorites" :class="{favorite:recipe.favorite, notFavorite: !recipe.favorite}" />
      <h2>
        {{ recipe.recipeName }}
      </h2>
    </div>
    <section class="servings">
      Serving size: {{ currentRecipe.servingSize }} | Creator Name:
      {{ creatorIsPrivate ? "anonymous" : firstLetterUppercase }}
    </section>

    <section class="description">
      <p>
        {{ currentRecipe.description }}
      </p>
    </section>
    <h2>Ingredients</h2>

    <div class="ingredients-img-container">
      <div class="ingredients">
        <!-- where ID = XYZ v-for Data.Ingredients -->
        <ul>
          <li
            v-for="(ingredient, index) in currentRecipe.ingredients"
            v-bind:key="index"
            class="ingredient"
            @click="addToGroceryList(ingredient)"
            title="Click To Add To Your Grocery List"
          >
            {{ ingredient.ingredient }} &nbsp;
            <i class="fa-solid fa-cart-shopping fa-flip-horizontal"></i>
          </li>
        </ul>
      </div>

      <div class="recipeImage">
        <img :src="currentRecipe.imgUrl" />
      </div>
    </div>

    <!-- <router-link :to="{name:'steps', params: { id: recipe.recipeId , rank:1}}"  target="_blank"> -->
    <button class="steps-btn" v-on:click="$emit('showStep')">
      Click Here to Follow the Instructions Step by Step
    </button>
    <!-- </router-link> -->

    <div class="instructions">
      <h2>Instructions:</h2>
      <ol>
        <li
          class="steps"
          v-for="(step, index) in currentRecipe.steps"
          v-bind:key="index"
        >
          <b> Step {{ step.rank }}:</b>
          {{ step.instruction }}
        </li>
      </ol>
      <div class="button-container">
        <router-link
          v-bind:to="{ name: 'edit-recipe', params: { id: recipe.recipeId } }"
          v-if="
            $store.state.user.id === recipe.creatorId ||
            $store.state.user.authorities[0].name == 'ROLE_ADMIN' ||
            isInLibrary
          "
          ><button>Edit Recipe</button></router-link
        >
        <button
          class="delete-btn"
          v-if="
            $store.state.user.id === recipe.creatorId ||
            $store.state.user.authorities[0].name == 'ROLE_ADMIN'
          "
        >
          Delete Recipe
        </button>
        <button
          id="featureButton"
          v-if="$store.state.user.authorities[0].name == 'ROLE_ADMIN'"
          v-on:click="toggleFeatured()"
        >
          {{
            this.$store.state.recipe.featured
              ? "Unfeature Recipe On Homepage"
              : "Feature Recipe On Homepage"
          }}
        </button>
      </div>
    </div>
  </div>
</template>


<script>
import APIService from "../services/APIService.js";
import FavoriteIcon from "./FavoriteIcon.vue";

export default {
  name: "recipeDetail",
  props: ["recipe"],
  components: {
    FavoriteIcon,
  },
  data() {
    return {
      ingredientName: "",
      creatorUsername: "",
      creatorIsPrivate: false,
    };
  },
  methods: {
    addToLibrary() {},
    deleteRecipe() {
      let choice = confirm("Are you sure that you want to delete this?");
      if (choice === true) {
        APIService.deleteRecipe(this.$route.params.id)
          .then((response) => {
            console.log(response);
            this.$router.push("/recipes");
          })
          .catch((error) => {
            if (error.response) {
              window.alert("Bad Request");
            } else if (error.request) {
              window.alert("Could not reach service");
            }
          });
      }
    },
    toggleFavorites() {
      this.$store.commit("FLIP_FAVORITE", this.recipe);
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
    bookMarkRecipe() {
      this.$store.commit("ADD_TO_LIBRARY", this.recipe);
    },
    unbookmarkRecipe() {
      this.$store.commit("DELETE_FROM_LIBRARY", this.recipe.recipeId);
    },
    addToGroceryList(ingredient) {
      if (!this.$store.state.groceryList.includes(ingredient.ingredient)) {
        this.$store.state.groceryList.push({
          item: ingredient.ingredient,
          recipeName: this.recipe.recipeName,
        });
        window.alert(`Added "${ingredient.ingredient}" to your grocery list.`);
      } else {
        window.alert(
          `"${ingredient.ingredient}" is already in your grocery list.`
        );
      }
    },
    toggleFeatured() {
      this.$store.commit("SET_FEATURED_RECIPE");

      APIService.setFeatured(this.recipe, this.$store.state.recipe.featured)
        .then((response) => {
          if (response.status === 200) {
            this.location.reload();
          }
        })
        .catch((error) => {
          if (error.response) {
            window.alert("Bad Request");
          } else if (error.request) {
            window.alert("Could not reach service");
          }
        });
    },
    stepByStep() {
      // this.$store.commit("STEP_BY_STEP", true)
      this.$emit("showStep");
    },
  },
  created() {
    APIService.getRecipe(this.$route.params.id).then((response) => {
      this.$store.commit("SET_RECIPE", response.data);
    });

    APIService.getCreatorUsernameByRecipeId(this.$route.params.id).then(
      (response) => {
        this.creatorUsername = response.data;
      }
    );

    // APIService.userPrivacy(this.currentRecipe.creatorId)
    //   .then((response)=>{
    //     this.creatorIsPrivate = response.data
    //   })
  },
  computed: {
    currentRecipe() {
      return this.$store.state.recipe;
    },
    firstLetterUppercase() {
      let name = this.creatorUsername.substring(0, 1).toUpperCase();
      name = name + this.creatorUsername.substring(1);
      return name;
    },
    isInLibrary() {
      for (let i = 0; i < this.$store.state.favoritedLibrary.length; i++) {
        if (
          this.$store.state.favoritedLibrary[i].recipeId ===
            this.$store.state.recipe.recipeId &&
          this.$store.state.user.id != this.recipe.creatorId
        ) {
          return true;
        }
      }
      return false;
    },
  },
};
</script>

<style scoped>
.container {
  overflow: auto;
  display: flex;
  flex-direction: column;
  background: #fff;
  border-radius: 20px;
  border: 1px #333 solid;
  padding: 1.3rem;
  overflow-x: hidden;
  max-width: 55rem;
  height: 120vh;
  max-height: 100vh;
  margin: 1rem 2rem;
  overflow-y: auto;
  padding-bottom: 5rem;
}
h2 {
  font-size: 1.5rem;
  width: 100%;
  padding-left: 10px;
  border-bottom: 3px solid #444;
}
h3 {
  font-family: "Averia Serif Libre", cursive;
  text-transform: capitalize;
  letter-spacing: 1px;
  padding-bottom: 0.3rem;
  font-size: 1.5rem;
  border-bottom: 10px solid #55695659;
}
.servings {
  position: relative;
  text-align: right;
  font-family: "Montserrat";
  color: #555;
  font-size: 0.8em;
  margin-top: 0px;
  left: -35px;
}

.favorite {
  border: none;
  padding: 6px;
  position: relative;
  top: -10px;
  right: -10px;
  background: transparent;
  font-size: 2rem;
  transition: 0.3s ease;

  margin: 0;
  z-index: 39;
}

.notFavorite {
  border: none;
  padding: 6px;
  position: relative;
  top: -10px;
  right: -10px;
  background: transparent;
  font-size: 2rem;
  transition: 0.3s ease;
  margin: 0;
  z-index: 39;
}

.fa-cart-shopping {
  font-size: 1rem;
  color: rgb(133, 133, 133);
}

.header-favorite-group {
  display: flex;
  flex-direction: row-reverse;
  justify-content: flex-start;
}

.description {
  text-align: justify;
  padding: 0rem 0.5rem;
  font-family: "DM Sans", sans-serif;
  font-weight: 300;
}

.ingredients {
  font-size: 1.1rem;
  font-family: "Lexend";
  overflow: none;
  flex-wrap: wrap;
  width: 30rem;
  line-height: 2.3rem;
  color: #555;
}

.ingredients li:nth-child(even) {
  color: rgb(28, 124, 15);
}

.ingredients-img-container {
  position: relative;
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  padding-bottom: 1rem;
  height: 90rem;
}
.recipeImage img {
  padding-top: 10px;
  object-fit: cover;
  max-height: 30rem;
  max-width: 30rem;
}

.steps {
  margin: 11px 0;
  border-bottom: #999 1px solid;
}
.steps-btn {
  font-family: "Montserrat", sans-serif;
  background: rgb(57, 82, 76);
  color: #fff;
  border-radius: 30px;
  border: 1px solid #333;
  font-size: 1rem;
  padding: 1.4%;
  float: right;
  position: relative;
  /* top: 30px; */
  transition: ease-in 0.4s;
}

.steps-btn:hover {
  background: #dd8902;
  border: 1px solid rgb(129, 82, 10);
  /* background-image: url('https://t4.ftcdn.net/jpg/02/87/02/71/240_F_287027124_R2xwyI2l2ncGKFqy6JF3Izaue1xEWfMn.jpg'); */
  transition: ease-out 0.3s;
}

.button-container {
  display: flex;
  justify-content: space-evenly;
  flex-wrap: wrap;
}
ul li {
  cursor: grab;
}
.instructions {
  font-size: 1.2rem;
  padding-right: 1.3rem;
  line-height: 2.2rem;
  font-family: "Lexend", sans-serif;
}

.instructions li {
  list-style-type: none;
}
.instructions ul {
}
.instructions ol li:nth-child(odd) {
  color: rgb(58, 150, 46);
}
::-webkit-scrollbar {
  width: 10px;
  scroll-padding-right: 3rem;
}

/* Track */
::-webkit-scrollbar-track {
  background: rgb(224, 222, 207);
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: #304b39e7;
  border-radius: 5px;
  scroll-padding-right: auto;
}

/* Handle on hover */
::-webkit-scrollbar-thumb:hover {
  background: rgb(111, 187, 130);
}

.delete-btn a {
  color: #fff;
}
.delete-btn {
  background: rgb(121, 15, 15);
}
.delete-btn:hover {
  background: #fb4c35;
}

#featureButton {
  background: goldenrod;
}

#featureButton:hover {
  background: gold;
}

.popup {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 99;
  background-color: rgba(0, 0, 0, 0.2);

  display: flex;
  align-items: center;
  justify-content: center;
}
.popup-inner {
  background: #fff;
  padding: 32px;
}

@media only screen and (max-width < 600px) {
  .ingredients{
    height: 20rem;
    width: 100vw;
    display: flex;
    font-size: 1.1rem;
  font-family: "Lexend";
  overflow: none;
  flex-wrap: wrap;
  width: 30rem;
  line-height: 2.3rem;
  color: #555;
  }
  ul{
    height: auto;
  }

  div.ingredients-img-container {
  display: flex;
  height:auto;
  align-content: center;
  flex-wrap: wrap;
}
.container{
  display: flex;
  flex-wrap: wrap;
  height: auto;
}

}
</style>  