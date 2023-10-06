<template>
  <button @click="$emit('toggle-favorites', recipe.recipeId)"
   class="btn btn-sm btn-primary">
    <i
      :class="[recipe.favorite ? 'fa-bookmark favorite' : 'fa-bookmark-o', 'fa']"
      aria-hidden="true"
    ></i>
  </button>
</template>

<script>
export default {
  date(){
    return {

    };
  },
  props: {    recipe: Object
    
  },
emits: ['toggle-favorites'],
methods:{}
};
</script>

<style scoped>

</style>
