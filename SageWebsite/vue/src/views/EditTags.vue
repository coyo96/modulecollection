<template>
  <div>
      <Tags v-if="$store.state.user.authorities[0].name == 'ROLE_ADMIN'"/>
  </div>
</template>

<script>
import APIService from "../services/APIService";

import Tags from "../components/Tags.vue"
export default {
    components:{Tags},
     methods:{
    addNewTag(){
        APIService.addTag(this.newTag).then((response) =>{
          if (response.status === 201){
              this.$router.push('/recipes')
          }
        }
      ).catch(
        (error) => {
          if(error.response) {
              window.alert('Bad Request');
          } else if(error.request) {
              window.alert('Could not reach service');
          }
        }
      );
    },
    deleteTag(){
        let choice = confirm("Are you sure that you want to delete this?");
        if (choice === true){
          APIService.deleteTag(this.tag).then(
              (response) =>{
              console.log(response);
              this.$router.push('/tags')
            }
          ).catch(
            (error) => {
          if(error.response) {
              window.alert('Bad Request');
          } else if(error.request) {
              window.alert('Could not reach service');
          }
          })  
      }
    }
  }

}
</script>

<style>


</style>