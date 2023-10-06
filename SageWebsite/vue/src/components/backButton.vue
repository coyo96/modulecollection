<template>
  <div>
    
    <button @click="goBack"> <i class="fa fa-arrow-left" aria-hidden="true"></i> Back</button>
  </div>
</template>


<script>
export default {
  methods: {
    goBack() {
      this.$router.go(-1);
    }
  }
};
</script>

<style scoped>

</style>
