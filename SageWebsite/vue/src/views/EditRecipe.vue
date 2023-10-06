<template>
  <div id="container">
    <div>
      <EditRecipeForm  v-if="
          this.$store.state.user.id === this.$store.state.recipe.creatorId ||
          this.$store.state.user.authorities[0].name == 'ROLE_ADMIN'
        "
      /><br />
      <edit-existing-recipe v-if="isInLibrary && (this.$store.state.user.id != this.$store.state.recipe.creatorId) &&
          (this.$store.state.user.authorities[0].name != 'ROLE_ADMIN')"/>
    </div>
  </div>
</template>

<script>
import EditExistingRecipe from "../components/EditExistingRecipe.vue";
import EditRecipeForm from "../components/EditRecipeForm.vue";
export default {
  components: { EditRecipeForm, EditExistingRecipe },
  methods: {
    isInLibrary() {
      for (let i = 0; i < this.$store.state.favoritedLibrary.length; i++) {
        if (
          this.$store.state.favoritedLibrary[i].recipeId ===
            this.$store.state.recipe.recipeId &&
          this.$store.state.user.id != this.$store.state.recipe.creatorId
        ) {
          return true;
        }
      }
      return false;
    },
  },
};
</script>

<style>
#container {
  display: flex;
  justify-content: center;
}
</style>