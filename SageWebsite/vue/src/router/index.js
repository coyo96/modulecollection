import Vue from 'vue'
import Router from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import HireUs from '../views/HireUs.vue'
import store from '../store/index'
import ExploreRecipes from '../views/ExploreRecipes.vue'
import RecipeDisplay from '../views/RecipeDisplay.vue'
import GroceryList from '../views/GroceryList.vue'
import Search from '../views/Search.vue'
import Settings from '../views/Settings.vue'
import MyCookbook from '../views/MyCookbook.vue'
import Meals from '../views/MyMeals.vue'
import EditRecipe from '../views/EditRecipe.vue'
import EditGroceryList from '../views/EditGroceryList.vue'
import FilterByTag from '../views/FilterByTags.vue'
import Tags from "../views/EditTags.vue"


Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  scrollBehavior: function (to, _from, savedPosition) {
    if (savedPosition) {
      return savedPosition;
    }
    if (to.hash) {
      return { el: to.hash, behavior: "smooth" };
    } else {
      console.log("moving to top of the page");
      window.scrollTo(0, 0);
    }
 },
  mode: 'history',
  
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/recipes",
      name: "explore-recipes",
      component: ExploreRecipes,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/my-cookbook",
      name: "my-cookbook",
      component: MyCookbook,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/recipes/:id",
      name: "recipe",
      component:RecipeDisplay,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/recipes/1/edit",
      name: "edit-recipe",
      component: EditRecipe,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/grocery-list",
      name: "grocery-list",
      component: GroceryList,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/grocery-list/edit",
      name: "edit-grocery-list",
      component: EditGroceryList,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/search/?=:keyword",
      name: "search",
      component: Search,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/filtered/:id",
      name: "filter-by-tag",
      component: FilterByTag,
      meta: {
        requiresAuth: false
      }
    },

    {
      path: "/settings",
      name: "settings",
      component: Settings,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/my-meals",
      name: "my-meals",
      component: Meals,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/tags",
      name: "tags",
      component: Tags,
      meta: {
        requiresAuth: true
      }
    },

    {
      path: "/hire-us",
      name: "hire-us",
      component: HireUs,
      meta: {
        requiresAuth: false
      }
    }
  ],
  
});

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});


export default router;
