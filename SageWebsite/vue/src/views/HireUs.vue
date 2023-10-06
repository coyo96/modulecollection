<template>
  <div class="container">
    <h3>Hire Us!</h3>
    
    <p>
      We are a group of full stack developers with a wide spectrum of skills and strengths! 
      Reach out to us to connect.
    </p><div class="borderbox"></div>
    <div class="everyone">
      <div class="Jackie smContainer">
     <img src="https://media.licdn.com/dms/image/C4E03AQGFZpeecOkjwQ/profile-displayphoto-shrink_800_800/0/1555011462875?e=1701907200&v=beta&t=OL0XOcNkfBTKHHobndZMUp1QN9gqHLJCOaIan0_ORpM" alt="" />
      <h4>Jackie Lee</h4>
      <p>jlee3545@gmail.com</p>
      <ul>
        <li> <a href="https://www.linkedin.com/in/ja-chi-jackie-lee/">LinkedIn </a></li>
      <li><a href="https://github.com/jlee3545/">GitHub</a></li>
      <li><a href="https://github.com/jlee3545/portfolio">Website</a></li>
      
      </ul>
   
      </div>

      <div class="Andrew smContainer">
       <img src="https://ca.slack-edge.com/T0GNFLF6D-U05AVE4NH46-00463462446a-512" alt="" />
      <h4>Andrew Sobotka</h4>
      <p> andrewsobotka@gmail.com </p>
      <ul>
        <li> <a href="https://www.linkedin.com/in/andrewjsobotka/">LinkedIn </a></li>
      <li><a href="https://github.com/andrewsobotka">GitHub</a></li>
      <li><a href="https://www.andrewsobotka.com/">Website</a></li>
      
      </ul>
   
      </div>


      <div class="Sefanit smContainer">
    <img src="https://ca.slack-edge.com/T0GNFLF6D-U05BLMVRG4D-c5d5b5b34ff0-512" alt="" />
      <h4>Sefanit Berihun</h4>
      <p>sefanit1719@gmail.com</p>
      <ul>
        <li> <a href="https://www.linkedin.com/in/sefanitberihun/">LinkedIn </a></li>
      <li><a href="https://github.com/sberihun/">GitHub</a></li>
      <li><a href="https://github.com/sberihun/">Website</a></li>
      
      </ul>
   
      </div>

      <div class="Coyo smContainer">

      <img src="https://media.licdn.com/dms/image/D5603AQGzQHcJEn4HWQ/profile-displayphoto-shrink_800_800/0/1689962533215?e=1701907200&v=beta&t=_ZrjbMRQJu2vEBXBD86Lwd1IbuzZ5kePcYEH3UwMW_A" alt="" />
      <h4>Coyo Lam</h4><p>coyo.lam96@gmail.com</p>
      
      <ul>
  
        <li> <a href="https://www.linkedin.com/in/coyolam/">LinkedIn </a></li>
      <li><a href="https://github.com/coyo96/">GitHub</a></li>
      <li><a href="https://coyo96.github.io/CoyosPortfolio/">Website</a></li>
      
      </ul>
   
      </div>
    </div>
  </div>
</template>

<script>
export default {
  components: {
  },
};
</script>

<style scoped>
.container{
  padding-top: 3rem;
  display:flex;
  flex-direction: column;
  font-family: 'Montserrat', sans-serif;
  justify-content: center;
align-items: center;
max-width: 90%;
}

.borderbox {
  width: 50%;
  position: relative;
  margin-top: .2rem;
  margin-bottom: 1.5rem;
}


ul li{
  list-style-type: none;
  color: #333;
}
h2{
  font-family: 'Averia Serif Libre', serif;
  border-bottom: 6px solid #444;
  width: 60%;
  text-align: center;
  justify-content: center;
  font-size: 1.5rem;
  

}
h3{
  margin: 0;
   border-bottom: 2px solid #444;

  margin: 10px;
}
.everyone img {
  height: 200px;
  width: 200px;
  border: 2px #fff solid;
  border-radius: 200;
  position: relative;
  left: 30px;
  object-fit: cover;
}

p{
 position: relative;
 top: -10px;
 right: -30px;
 letter-spacing: .5px;
}
.everyone a{
font-family: 'Montserrat', sans-serif;
text-decoration: none;
color: #fff;
background: rgb(155, 209, 105);
padding: 6px;
line-height: 2.2rem;
min-width: 3rem;
border-radius: 5px;

}



.everyone a:hover{
font-family: 'Montserrat', sans-serif;
text-decoration: none;
background: rgb(85, 151, 54);

}




h4{
  text-align: center;
  position: relative;
  left: 20px;
}
.smContainer{
  margin: 30px;

}
.everyone{
  display: flex;
  text-align: center;
  align-items: center;
}

.Jackie{
  
}

</style>