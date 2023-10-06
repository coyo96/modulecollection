<template>
  <div id="app">
    <div id="nav" class="navLayer" >
      <NavigationMenu />
    </div>
    <router-view class="appLayer" />
    <TheFooter class="footer" />
  </div>
</template>



<script>
// import RecipeCard from './components/RecipeCard.vue'
// import TheHeader from './components/TheHeader.vue'
import TheFooter from "./components/TheFooter.vue";
import NavigationMenu from "./components/NavigationMenu.vue";
// import APIService from "./services/APIService.js";

export default {
  name: "app",
  props: {},
  components: {
    TheFooter,
    NavigationMenu,
  },
  methods: {
    mobile() {
      return this.$vuetify.breakpoint.sm;
    },
  },
  created() {
    // APIService.getRecipes().then(response => {
    //   this.$store.commit('SET_RECIPES', response.data)
    // })
    // APIService.getRecipesByFeatured().then(response=>{
    //   this.$store.commit('SET_FEATURED', response.data)
    // })
  },
};
</script>

<style scoped>
@import url("https://fonts.googleapis.com/css2?family=Averia+Serif+Libre:ital,wght@0,300;1,300&family=Caprasimo&family=DM+Sans:opsz,wght@9..40,200;9..40,300;9..40,500&family=Lexend:wght@200;300&family=Montserrat:wght@300;400&display=swap");

.appLayer {
  z-index: 1;
}

.navLayer {
  z-index: 10;
}

* {
  top: 0px;
  left: 0px;
  background-size: auto;
  width: 100%;
  height: 100%;
  margin: 0px;
  padding: 0px;
  overflow-x: hidden;
}
#app {
  padding-top: 9rem;
  /* background-image: url('https://img.freepik.com/free-photo/cream-canvas-textured-background-beige-minimal-design_53876-160754.jpg?w=996&t=st=1695935379~exp=1695935979~hmac=a0470e262b41f6a2915a9ffac22c8d9aadbc2cca6150b1a0d6bba519287344e1'); */
  /* background-image: url('https://img.freepik.com/premium-photo/abstract-white-background-text-paper-page-texture_84485-2550.jpg?w=740'); */
  background-size: repeat;
  margin: 0px;
  background-color: rgba(205, 218, 201, 0.253);
}

.footer {
  position: relative;
  padding-top: 10rem;
}
</style>
