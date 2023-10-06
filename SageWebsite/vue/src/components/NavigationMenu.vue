<template>
  <div>
    <div class="navigationmenu">
      <div class="headerbar">
        <div class="logo">
          <div class="logo-img">
           <router-link v-bind:to="{ name: 'home' }"> <img src="https://i.imgur.com/q1E063E.png" alt="" />
            </router-link>
          </div>
          <router-link v-bind:to="{ name: 'home' }" class="sageTitle"> Sage </router-link>
        </div>

        <div class="navbar">
          <NavDropDown class="menu" />

          <!-- <router-link
            v-bind:to="{ name: 'logout' }"
            v-if="$store.state.token != ''"
            class="logout"
            >Logout</router-link
          > -->
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import NavDropDown from "./NavDropDown.vue";

export default {
  components: {
    NavDropDown,
  },
};
</script>

<style scoped>
* {
}
.logo-img img {
  width: 4rem;
  height: 4rem;
  /* margin: .1rem; */
}
.navigationmenu {
  width: 100%;
  left: 0px;
  top: 0px;
  cursor: pointer;
  position: Fixed;
  z-index: 99;
  /* border-bottom: 2px solid rgba(56, 68, 58, 0.39); */
}

.menu {
  position: relative;
  left: -50px;
}

.headerbar {
  top: 0px;
  padding: 2rem;
  background: #c7e2c0;

  background-image: url("https://images.unsplash.com/photo-1524222717473-730000096953?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80");
  background-position: 100% 37%;
  background-size: 125%;
  background-repeat: no-repeat;
  display: flex;
  justify-content: space-between;
  align-items: center;
  color: #333;
  font-family: "Montserrat";
  z-index: 3;
}

a {
  /* color: #fff; */
  text-decoration: none;
}

.headerbar a {
  margin: 0.4rem;
  font-family: "Montserrat";
  font-size: 1rem;
  font-weight: 200;
  color: #fff;
}

.navbar {
  justify-content: flex-end;
  position: relative;
  font-size: 1rem;
  transition: ease 3s;
}
.navbar a:hover {
  color: #bad89c;
  transition: ease 0.7s;
  /* border-bottom: 3px solid #bad89c; */
  transform: scale(0.1);
}

.logout {
  color: rgb(80, 104, 25);
  text-decoration: none;
  font-size: 1rem;
}

.logo {
  display: flex;
  align-items: center;
  justify-content: center;
   position: relative;
    left: 30px;
    
}
.logo a {
  text-decoration: none;
  font-family: "Young Serif", serif;
  font-size: 3rem;
  letter-spacing: 1px;
  color: rgb(40, 112, 49);
  transition: all 0.5s ease;
  padding: 0 10px;
  -webkit-text-stroke: 1px rgba(103, 182, 120, 0.863);
  mix-blend-mode: invert;
}
.logo a:hover {
  letter-spacing: 3px;
  color: #fbfbfb;
  -webkit-text-stroke: 1.2px #c5b39e77;
}

@media only screen and (max-width: 680px) {
  .headerbar {
   background-size: 200%;
  /* background-size: 350%; */
  background-repeat: no-repeat;
  background-position: 43% 35%;
  background-image: url("https://images.unsplash.com/photo-1524222717473-730000096953?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2070&q=80");
  transition: ease 1s;
  }

  .sageTitle {
    display:none;
  }

  .logo-img{
    margin-left: -50px;
  margin-top: 10px;
  }

  .menu {
    position: relative;
    margin-top: -50px;
  }
}
</style>