<template>
  <div
    class="tag-selection"
    :class="{ 'tag-selected': isSelected }"
    @click="toggleSelection"
  >
    <!-- {{ recipe.tag }}
    -->

    NAME OF ITEM

  </div> 
</template>

<script>
export default {
  props: {
    label: String,
  },
  data() {
    return {
      isSelected: false,
    };
  },
  methods: {
    toggleSelection() {
      this.isSelected = !this.isSelected;
    },
  },
};
</script>

<style scoped>
.tag-selection {
  font-family: 'Montserrat';
  font-size: 1rem;
  color: #707070;
  font-weight: bold;
  display: inline-block;
  padding: .5rem .7rem;
  border: 2px solid #707070;
  border-radius: 20px;
  background-color: #d4d0d0;
  cursor: pointer;
  user-select: none;
  transition: background-color 0.3s ease-in-out;
}

.tag-selected {
  background-color: #53aa69; 
  color: #fff; 
}
</style>
