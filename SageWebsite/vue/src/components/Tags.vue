<template>
  <div class="body">
      <div id = "title">
              <h2>Edit Tag List:</h2>

      </div>
    <div class="body2">
        
        <form id="add-tag" v-on:submit.prevent="addNewTag()">
          <label for="add"></label>
          <input
            id = "add-input"
            type="text"
            name="add"
            v-model="newTag.tag"
            placeholder="ie: vegan"
          />
          <button type="submit" class="submit-btn" >Add Tag</button>

        </form>

    <div class="tagsList">
    <div id ="tag-container">
        <div id = "inner-container">
       <label ><b>Select a tag to edit/delete: </b></label>

      <div
        class="field"
        v-for="tag in $store.state.tags"
        v-bind:key="tag.tagId"
        v-bind:value="tag.tagId"
      >
      <div>
        <input
          type="radio"
          class="tag"
          v-bind:value="tag.tagId"
          v-bind:name="tag.tag"
          v-model="selectedTagId"
        />
        
        <label v-bind:for="tag.tag">{{ tag.tag }}</label>
      </div> 
        </div><br>
      </div>
      </div>
      <div class="buttons">
      <button class="delete-btn" v-on:click="deleteTag">Delete Tag</button>
      <button id = "edit-btn" v-on:click="getTagById">Edit Tag</button>
      </div>
      
      </div>
      <form v-on:submit.prevent="editTag()" v-if="tagToUpdate.tag != ''">
          <label for="edit">Edit tag: </label>

          <input
            type="text"
            name="edit"
            v-model="tagToUpdate.tag"
            placeholder="ie: vegan"
          />
          <button type="submit" class="submit-btn" >Update Tag</button>

        </form>

      
    </div>
  </div>
</template>

<script>
import APIService from "../services/APIService";
export default {
  data() {
    return {
      newTag: { tag: "", tagId: 0 },
      tagToUpdate:{tag: "", tagId: 0 },
      updatedTag:{},
      selectedTagId:0
    };
  },
  created() {
    APIService.getTags().then((response) => {
      this.$store.commit("SET_TAGS", response.data);
    });
  },
  methods: {
    addNewTag() {
    if(this.newTag != ""){
        APIService.addTag(this.newTag)
        .then((response) => {
            location.reload();
          if (response.status === 200) {
            window.alert(`You have added ${this.newTag.tag}!`);
          }
        })
        .catch((error) => {
          if (error.response) {
            window.alert("Bad Request");
          } else if (error.request) {
            window.alert("Could not reach service");
          }
        });
    }
      
    },
    deleteTag() {
      let choice = confirm("Are you sure that you want to delete this?");
      if (choice === true) {
        APIService.deleteTag(this.selectedTagId)
          .then((response) => {
               if (response.status === 200) {
            window.alert('You have deleted a tag!');
                               location.reload();

               }
          })
          .catch((error) => {
            if (error.response) {
              window.alert("Bad Request");
            } else if (error.request) {
              window.alert("Could not reach service");
            }
          });
      }
    },
    editTag(){
        APIService.editTag(this.tagToUpdate).then(
          (response) => {
            if(response.status === 200) {
                location.reload();
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
    getTagById(){
        APIService.getTag(this.selectedTagId).then(
            (response) => {
                this.tagToUpdate.tag= response.data.tag;
                this.tagToUpdate.tagId=response.data.tagId;
            }
        )
    }
    }
};
</script>

<style scoped>

.body {
  position: relative;
  background: #fff;
  border-radius: 30px;
  border: 2px solid #333;
  width: auto;
  height: auto;
  margin: auto;
  margin-top: 3rem;
  position: relative;
  font-family: "DM Sans", sans-serif;
  text-align: center;
  padding: 1rem 3rem;
  width: 30%;
}

h2{
    text-align: center;
}

.tagsList{
    text-align: left;
}

#title{
    display: flex;
    justify-content: center;
}

#title h2{
    width:20rem;
}

.buttons{
    display: flex;
    justify-content: center;
    align-content: center;
    width: 100%;
    height: 3rem;
}

button{
    margin-top:0px;
    margin-bottom: 0px;
    height: auto;
    text-align: center;
    text-justify: center;
}

#edit-btn{
    margin-top:0px;
}
.field{
    display: flex;
    justify-content: left;
    text-align: left;
}

#tag-container{
    margin:1rem;
    display: flex;
    justify-content: center;
}

#add-tag{
    margin-top: 1rem;
}

#add-tag input{
    width: 10rem;
}

#add-input{
    width: 10rem;
    margin-bottom: 1rem;
}
</style>