<!-- NavigationMenu.vue -->
<template>
  <div class="navigation-menu">
    <button @click="toggleDropdown">
      {{ selectedPage ? selectedPage.label : "Menu" }}
    </button>

    <div class="overlay">
      <ul v-if="isDropdownOpen" class="overlay-content" >
        <li v-for="page in pages" :key="page.name" >
          <router-link :to="{ name: page.name }" @click="closeDropdown" v-if="$route.path != `/${name}`">
            {{ page.label }}
          </router-link>
        </li>
         <li v-if="$store.state.token != ''">
          <router-link to="/logout">Logout</router-link>
        </li>
        <li v-if="$store.state.token == ''">
          <router-link to="/login">Log In</router-link>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      isDropdownOpen: false,
      selectedPage: null,
      pages: [
        { label: "Home", name: "home" },
        { label: "Explore Recipes", name: "explore-recipes" },
        { label: "My Cookbook", name: "my-cookbook" },
        { label: "Grocery List", name: "grocery-list" },
        // { label: "My Meals", name: "my-meals" },

        // Add more pages as needed
      ],
    };
  },
  methods: {
    toggleDropdown() {
      this.isDropdownOpen = !this.isDropdownOpen;
    },
    closeDropdown() {
      this.isDropdownOpen = false;
    },
  },
};
</script>

<style scoped>
.navigation-menu {
  display: inline-block;
  position: relative;
  
}

.overlay {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 1;
  top: 0;
}

.overlay-content {
  position: relative;
  top: 103px;
  width: 100%;
  text-align: center;
  margin-top: 5px;
}

ul {
  list-style-type: none;
  padding: 0;
  left: .10rem;

border-radius: 3px;
  filter: blur(30%);
  border: 1px solid #ccc;
  z-index: 13;
}

ul a {
  font-family: "Montserrat";
  color: #333;
  font-weight: bold;
  text-decoration: none;
}
button {
  border-radius: 3px;
  border: 0.4px solid rgba(255, 255, 255, 0.486);
  padding: 0.6rem 4rem;
  transition: ease 0.8s;
  font-family: 'Montserrat', sans-serif;

  background-color: rgb(43, 143, 39);
}
button:hover {
  color: rgb(255, 255, 255);
  background-color: rgb(12, 68, 5);
}
li {
  position: relative;
  padding: 10px;
  border-bottom: 1px solid #ccc;
  width: 150px;
  background-color: rgb(255, 255, 255);
  align-items: center;

}

li:hover {
  background: rgb(216, 241, 200);
transform: scale(1.03);
}
li:last-child {
  border-bottom: solid #333 2px;
}


@media only screen and (max-width: 550px) {



.overlay-content {
  position: relative;
  top: 90px;
  width: 100%;
  text-align: center;
  margin-top: 5px;
}

  
}
</style>
