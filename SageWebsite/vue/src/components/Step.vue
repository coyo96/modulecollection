<template>
<div id="container">
  <div id="login" class="login-body">
      <h2 id="title" >Step {{stepNumber}} </h2><br/>
      <p>{{$store.state.recipe.steps[ `${stepNumber-1}`].instruction}}</p>
      <div id = "buttonContainer">
      <back-button v-if="$route.params.rank != 1"/>
      <div id=#whiteBox v-if="$route.params.rank == 1"></div>
      <button class="steps-btn" v-on:click="$router.push(nextStep())" v-if="Number(this.$route.params.rank) != $store.state.recipe.steps.length">Next <i class="fa fa-arrow-right" aria-hidden="true"></i></button>
      <button class="steps-btn" v-on:click="$router.push('/recipes')" v-if="Number(this.$route.params.rank) == $store.state.recipe.steps.length">Done! <i class="fa-solid fa-check" style="color: #ffffff;"></i></button>
      </div>
  </div>
</div>
</template>

<script>
import APIService from "../services/APIService.js";
import BackButton from './backButton.vue';
export default {
  name: "Steps",
  components: {BackButton},
  data() {
    return {
        recipe:Object,
    };
  },
  methods: {
    nextStep(){
        return "/recipes/" + this.$route.params.id+ "/steps/" + (Number(this.$route.params.rank) +1);
    }
    
    
  },
  computed:{
      stepNumber(){
          return this.$route.params.rank;
      },
      
      
  },
    created() {
        APIService.getRecipe(this.$route.params.id)
      .then((response) => {
        this.$store.commit("SET_RECIPE", response.data);
    });
  },

  
};
</script>

<style scoped>



.login-body {
  position: relative;
  background: #fff;
  border-radius: 30px;
  border: 2px solid #333;
  width: auto;
  height: auto;
  margin: auto;
  position: relative;
  font-family: "DM Sans", sans-serif;
  text-align: center;
  padding: 1rem 3rem;
  width: 50%;
  display: flex;
}

.loginDiv a {
  color: #333;
}

h2{
  text-decoration:none;
  border-bottom: none;
  background: transparent;
}

#title{
  text-align: center;
  width:100%;
}



#buttonContainer{
  display: flex;
  justify-content: space-between;
  align-content: right ;
}

#whiteBox{
  color: #fff;
}

p{
  font-size: 1.7rem;
}

#container{
  display: flex;
  justify-content: center;
  align-content: space-around;
}

@media only screen and (max-height: 700px) {
  .login-body {
  position: relative;
  background: #fff;
  border-radius: 30px;
  border: 2px solid #333;
  width: auto;
  height: auto;
  margin: auto;
  position: relative;
  font-family: "DM Sans", sans-serif;
  text-align: center;
  padding: 1rem 3rem;
  width: auto;
  font-size: auto;
  }
}
</style>