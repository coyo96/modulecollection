import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'

Vue.use(Vuex)

/*
 * The authorization header is set for axios when you login but what happens when you come back or
 * the page is refreshed. When that happens you need to check for the token in local storage and if it
 * exists you should set the header so that it will be attached to each request
 */
const currentToken = localStorage.getItem('token')
const currentUser = JSON.parse(localStorage.getItem('user'));

if(currentToken != null) {
  axios.defaults.headers.common['Authorization'] = `Bearer ${currentToken}`;
}

export default new Vuex.Store({
  state: {
    token: currentToken || '',
    user: currentUser || {},
    // listOfTags: [
    //   { tag: "breakfast", tagId: 6},
    //   { tag: "dinner", tagId: 2},
    //   { tag: "vegan", tagId: 3},
    //   { tag: "dairy-free", tagId: 4},
    //   { tag: "keto", tagId: 5},
    //   { tag: "lunch", tagId: 7},
    //   { tag: "vegetarian", tagId: 1},
    // ],
    tags:[],
    selectedTagId:0,
    selectedTag:"",
    filteredList:[{}],
    groceryList:[{item:"1 carton of milk", recipeName:"Mac and Cheese"}, {item:"1 carton of eggs", recipeName: "Omelet"},{item: "1 block of parmesan cheese", recipeName: "Spaghetti"} ],
    featuredList:[{favorite:false}],
    recipe:{featured:false},
    keyword:"",
    favoritedLibrary:[],
    recipes:[
      // {
      //   recipeId:1,
      //   creatorUsername: "user",
      //   recipeName: "Cheese Pizza",
      //   recipeDescription: "Cheese, Sauce, and Crust. It's always good. Make it.",
      //   servingSize: 4, 
      //   ingredients: ["1 cup mozzarella cheese", "1/2 pound dough", "1 jar of sauce"],
      //   steps: ["Set the oven to 375 degrees.", "Roll out your dough.", "Spread the sauce on the dough.","Sprinkle on the cheese on.", "Bake for 15 minutes."],
      //   image:"https://www.recipetineats.com/wp-content/uploads/2023/05/Garlic-cheese-pizza_9.jpg" 
      // },
      // {
      //   recipeId:2,
      //   creatorUsername: "admin",
      //   recipeName: "Sourdough Bread",
      //   recipeDescription: "It's not actually sour, but it is bread.",
      //   servingSize: 6, 
      //   ingredients: ["1 tsp. yeast", "1 cup flour", "3 tbsp. water","1/2 tsp. salt"],
      //   steps: ["Set the oven to 375 degrees.", "Mix wet ingredients.", "Slowly add dry ingredients", "Let bread sit for an hour to rise.", "Put dough in oven and bake for 1 hour."],
      //   image:"https://plus.unsplash.com/premium_photo-1661770191552-90e12a9c41aa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80"
        
      // },
      // {
      //   recipeId:3,
      //   creatorUsername: "user",
      //   recipeName: "Spaghetti",
      //   recipeDescription: "Delicious red tomato sauce and amazing spaghetti.",
      //   servingSize: 2, 
      //   ingredients: ["1 box of pasta", "1 jar of tomato sauce", "3 tbsp. parmesan cheese"],
      //   steps: ["Boil water", "Put pasta in boiling water and cook for 10 minutes or until al dente", "Put the sauce on."],
      //   image: "https://images.unsplash.com/photo-1627042633145-b780d842ba45?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80"
      // },

    ]
  },
  mutations:
  {
    SET_AUTH_TOKEN(state, token) {
      state.token = token;
      localStorage.setItem('token', token);
      axios.defaults.headers.common['Authorization'] = `Bearer ${token}`
    },
    SET_USER(state, user) {
      state.user = user;
      localStorage.setItem('user',JSON.stringify(user));
    },
    LOGOUT(state) {
      localStorage.removeItem('token');
      localStorage.removeItem('user');
      state.token = '';
      state.user = {};
      axios.defaults.headers.common = {};
    },
    SET_RECIPES(state, recipes){
      state.recipes = recipes;
    },
    ADD_INGREDIENT(state, ingredient) {
      state.groceryList.push(ingredient);
    },
    SET_RECIPE(state, recipe){
      state.recipe=recipe;
    },
    SET_FILTERED(state, recipes){
        state.filteredList = recipes;
    },
    SET_KEYWORD(state, search){
      state.keyword = search;
    },
    ADD_RECIPE(state, recipe){
      state.recipes.push(recipe);
    },
    SET_FEATURED(state, recipes){
      state.featuredList = recipes;
    },
    FLIP_FAVORITE(state, recipe){
      recipe.favorite = !recipe.favorite
      for(let i = 0; i < state.featuredList.length; i++){
        if(state.featuredList[i].recipeId === recipe.recipeId){
          state.featuredList[i].favorite = !state.featuredList[i].favorite;
        }
      }
    },
    SET_TAGS(state, tag){
      state.tags = tag;
    },
    SET_SELECTED_TAG_ID(state,tagId){
      state.selectedTagId = tagId;
    },
    SET_SELECTED_TAG(state,tag){
      state.selectedTag = tag;
    },
    SET_FEATURED_RECIPE(state){
      if(state.recipe.featured === false){
        state.recipe.featured = true;
      }else{
        state.recipe.featured = false;
      }
    },
    ADD_TO_LIBRARY(state,recipe){
      state.favoritedLibrary.push(recipe);
    },
    DELETE_FROM_LIBRARY(state, recipeId){
        let newArray = [];
        for (let i = 0; i < state.favoritedLibrary.length; i++) {
          if (state.favoritedLibrary[i].recipeId != recipeId) {
            newArray.push(state.favoritedLibrary[i]);
          }
        }
        state.favoritedLibrary = newArray;
    },
    UPDATE_RECIPE(state, editedRecipe){
      for(let i = 0; i < state.recipes.length; i++){
        if(state.recipes[i].recipeId == editedRecipe.recipeId){
          state.recipes[i] = editedRecipe;
        }
      }
    },
    ADD_TO_GROCERY_LIST(state, ingredient){
      state.groceryList = ingredient;
    },
    TOGGLE_ITEM_COMPLETE(state, index){

      state.groceryList[index].isComplete = !state.groceryList[index].isComplete
    }
  }
})
