<template>
    <div class= "body">
        <div id = "grocery">
            <div id = "list-title">
            <h2>My Grocery List</h2>
            </div> <br>
        <div id = "list-container">

        <ul>
            <li v-for="(item,index) in $store.state.groceryList" v-bind:key="index" :class="item.status?'checked':'unchecked'">
                <input id= "check" type="checkbox" v-bind:key="index" v-bind:value="true" v-model="item.status"/>
                <b>{{item.item}}</b> for <b>{{item.recipeName}}</b> <br/>
                <div id = "line" v-if="index != $store.state.groceryList.length-1"><br></div>
            </li>
       
        </ul>
        </div>
        </div><br>
        <div id = "button-container-2">
        <div id="button-container">
        <router-link
            v-bind:to="{ name: 'edit-grocery-list' }"><button>Edit Grocery List</button></router-link>
        </div>  
        </div>
    </div>
  
</template>

<script>
export default {
  data() {
    return {
      indexOfGroceryList: [],
    };
  },
  methods: {
    deleteItems() {
      let newArray = [];
      for (let i = 0; i < this.newRecipe.ingredients.length; i++) {
        if (!this.indexOfIngredients.includes(i)) {
          newArray.push(this.newRecipe.ingredients[i]);
        }
      }
      this.newRecipe.ingredients = newArray;

      this.indexOfGroceryList = [];
    },
    isChecked(){
        if(this.indexOfGroceryList.includes(this.index)){
            return true;
        }else{
            return false;
        }
    }
  },
};
</script>

<style scoped>
.body{
    background: white;
    padding-bottom: 3rem;
}

#grocery {
  display: block;
  align-items:center;
  margin-left: 0px;
  background: #fff;
}

h2{
    text-align: left;
    margin-left:0px;
    padding:0px;
    background: #fff;
    width:35rem;
    margin-bottom: 0px;
    padding-bottom: 0px;
}

li {
  list-style: none;
  font-size: 1rem;
  background: #fff;
  margin-right: 20%;
font-family: 'Montserrat', sans-serif;
line-height: 1.5rem;
}

ul {
  width: 35rem;
  background: #fff;
  
}

#check {
  margin-right: 3%;

}

div #line {
  width: 100%;
  border-top: #333, 1px;
  height: 1px;
  background: black;
  margin-top: 2%;
  margin-bottom: 2%;
}

#button-container{
    display:flex;
    justify-content: center;
    align-content: center;
    margin-top:0px;
    width:35rem;
    align-content: top;
}

#button-container-2{
    display:flex;
    justify-content: center;
    text-decoration: none;

}

#list-title{
    display: flex;
    justify-content: center;
    margin:0px;
}

#list-container{
    display: flex;
    justify-content: center;
    font-family: "Montserrat";
}


.checked{
    text-decoration: line-through  ;
}

div table{
  border: black;
  border-width: 3px;
}

#itemColumn{
  width: 1rem;
}



</style>