<template>
  <div class="container">
    <form id="addNewMealPlan" v-on:submit.prevent="createMealPlan">
      <div>
        <h3>Add A New Meal Plan</h3>
      </div>
      <div class="field">
        <label for="recipeName">Title: </label><br/>
        <input
          type="text"
          name="mealListName" 
          v-model="newMeal.recipeName"
          placeholder="ie: Monday's Plan"
        />
      </div>
      
      <br />
      <div class="field">
        <label for="description">Description: </label>
        <textarea name="description" v-model="newMeal.description" 
        placeholder="In laws are in town. No Gluten!" />
      </div>

      <div id="url-section">
        <label for="image">Add a URL for an Image:</label><br>
        <input
          id="url"
          type="text"
          name="image"
          v-model="newMeal.imgUrl"
          placeholder="www.image.com"
        />
      </div>



      <!-- <label for="tags">Tags:</label>
      <div class="tagsList">
        <div
          class="field"
          v-for="(tag, index) in $store.state.listOfTags"
          v-bind:key="index"
        >
        
          <input
            type="checkbox"
            id="tag"
            v-bind:value="tag.tag"
            v-bind:name="tag.tag"
            v-model="newRecipe.tags"
          />
        <label for="tag">{{ tag.tag }}</label>
        </div>
      </div> -->

      <div class="submitDiv">
        <button type="submit" value="Submit New Recipe" class="submit-btn">
          Create Meal Plan
        </button>
      </div>
    </form>
  </div>
</template>

<script>
// import APIService from '../services/APIService';
export default {
     name: "MealForm",
  data() {
    return {
      newMeal:{},
    
    }
  },
  methods: {
    createMealPlan() {
    
  },

},
};
</script>

<style scoped>
.container {justify-content: center;
  max-width: 21rem;
  display: flex;
  flex-direction: column;
  width: 100%;
  cursor: pointer;
  min-width: 30rem;
  overflow-x: hidden;
}
div a {
  color: #333;
}

textarea {
  position: relative;
  min-width: 28rem;
  height: 10rem;
  background-color: #d9e9fa;
  border: none;
  font-family: "Montserrat", sans-serif;
  font-size: 1rem;
  letter-spacing: 1.5px;
  color: rgba(14, 0, 0, 0.623);
  margin: 10px 0;
  padding: .6rem;
}

input{
      width: 28rem;
      margin-top: 10px;

}
input::placeholder {
  font-family: "Montserrat", sans-serif;
  padding: 6px;
  color: rgba(119, 119, 119, 0.623);
}

.title{
  margin-top: 0.7rem;
    width: 23rem;
}

h3{
  padding-bottom: 1rem;
}
.field ul li {
  list-style-type: none;
}

.ingredients-btn {
  margin-left: 20%;
  background: rgb(228, 243, 187);
  border-radius: 0;
  position: relative;
}

.submitDiv{
  display: flex;
  justify-content: center;
}

.submitDiv button {
  background: rgba(115, 202, 198, 0.623);
  border-radius: 0;
  color: rgb(39, 2, 2);
  font-family: "Montserrat", sans-serif;
  font-weight: bold;
  margin-top: 4rem;
  transition: ease 0.5s;
}
.submit-btn:hover {
  background: rgb(63, 133, 98);
  color: #fff;
}

.tagsList {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  margin: 1rem 0;
}

.tagsList input, .tagsList label{
  margin: .2rem;
  margin-bottom: 1rem;
  text-align: center;
}

li{
    font-family: "Montserrat";
    text-justify: top;
}

#url{
  margin-top: 10px;
    width: 28rem;
}


</style>
