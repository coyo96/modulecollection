<template>
  <div class="cardsContainer">
    <div class="name-img-container">
     <img src="https://images.unsplash.com/photo-1614173417106-242690007604?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDEyfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60" class="image-fit"
      />
      <div class="title-servings-combo">
       
        <!-- <div class="borderbox"></div> -->

           <h3>List Name</h3>     
              <div class="description">
          <p> Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam aspernatur sequi eveniet, vero sed vel assumenda et minima doloremque illum sapiente laudantium mollitia magni error nisi voluptas tenetur. Consequuntur, adipisci.
              
              Lorem ipsum dolor sit amet consectetur, adipisicing elit. Obcaecati, voluptates!


          </p>
        </div>
   
        </div>
  
  
    </div>
  </div>
</template>



<script>
export default {
  name: "MealPlanCard",
  components: {},
};

</script>

<style scoped>
.cardBody {

  filter: saturate(1);
  transition: all ease-in-out 2s;
}
.image-fit {
  border: 2px solid rgba(158, 125, 125, 0.747);
  height: 30rem;
  width: 20rem;
  object-fit: cover;
  border-radius: 6px;
  margin: 1rem 2rem;
  
}


.name-img-container {
  position: relative;
}

.name-img-container:hover {
  will-change: transform, opacity;
  -webkit-transform: scale(1.1);
  -moz-transform: scale(1.1);
  transform: scale(1.1);
  filter: saturate(1.2);
  transition: all ease-in-out 0.5s;
}

.title-servings-combo {
  position: absolute;
  top: 67%;
  left: 34px;
  border-radius: 0px 0px 3px 3px;
  width: 20rem;
  height: 8rem;
  object-fit: contain;
  background: #fffdfbe0;
  overflow-y: scroll;
  
  
}
.title-servings-combo a {
  color: #333;
  text-decoration: none;
}
.borderbox {
  width: 50%;
  position: relative;
  left: 25%;

}

.container{
  height: 22rem;
  width: 20rem;
}



h3 {
  position: absolute;
  top: -12%;
  left: 3%;
  font-size: 1.5rem;
  border-bottom: 2px solid #333;
  width: 93%;
  text-align: center;
  
}

.description {
  position: absolute;
  padding: 5%;
  margin-top: 0px;
  font-size: 1rem;
  top: 12%;
  object-fit: contain;
}

.servings {
  color: rgba(100, 66, 15, 0.664);
  font-weight: bold;
  position: absolute;
  right: 3%;
  top: 80%;
}
</style>