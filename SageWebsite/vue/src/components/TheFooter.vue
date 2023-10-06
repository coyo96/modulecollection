<template>
  <div>
    <div class="blank"></div>
    <footer>
      <div class="footerlinks-container">
        <div class="logo">
          <!-- <img src="https://i.imgur.com/q1E063E.png" alt=""> -->
        </div>
        <div class="links">
          <div>
            <a href="/settings" class="footerlink"> Settings </a>
          </div>
          <div>
            <a href="#form" class="footerlink"> Contact Sage </a>
          </div>
          <div>
            <router-link :to="{ name: 'hire-us' }">Hire Us</router-link>
          </div>
        </div>

        <div class="links sageInc">2023 ® Sage, Inc.</div>
      </div>
    </footer>
  </div>
</template>

<script>
export default {};
</script>

<style scoped>
/* .blank {
  padding-top: 15rem;
} */

.blank {
}

footer {
  background: #cddfbc;
    justify-content: center;
display: flex;
  padding: 1rem;
  position: relative;
  background-size: 115%;
  /* background-size: 350%; */
  background-repeat: no-repeat;
  background-position: 0% 73%;
  background-image: url("https://images.unsplash.com/photo-1503810473512-f64b56827964?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80");
  /* border-top: rgba(51, 51, 51, 0.466) solid  1px; */
}

footer a {
  display: flex;
  color: rgb(255, 255, 255);
  font-size: 1.3rem;
  font-family: "Montserrat", sans-serif;

  margin: 15px;
  text-align: left;
  text-decoration: none;
  /* mix-blend-mode: difference; */
}

.sageInc {
  /* color: #333; */
  color: rgb(255, 255, 255);
}
footer a:hover {
  color: rgba(231, 253, 255, 0.89);
  font-weight: bold;

  /* transform: scale(2.35); */
}

div {
  position: relative;
  margin-top: 30px;
  font-family: "Montserrat";
  background-color: transparent;
  text-align: center;
  align-content: flex-end;
}

.footerlinks-container {
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;
  margin-bottom: 2rem;
  line-height: 1px;
  padding-bottom: 30px;
  margin: auto;
  position: relative;
  padding-right: 2rem;
  flex-wrap: wrap;
}

.logo {
  justify-content: start;
}
.links {
  justify-content: space-between;
  display: flex;
  color: rgb(231, 231, 208);
  flex-wrap: wrap;
  margin-right: -30px;
}

.links img {
  width: 10rem;
  height: 10rem;
}

@media only screen and (max-width: 980px) {
  footer {
    background-size: 300%;
    /* background-size: 350%; */
    background-repeat: no-repeat;
    background-position: 40% 73%;
    background-image: url("https://images.unsplash.com/photo-1503810473512-f64b56827964?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1974&q=80");
    transition: ease 1s;
  }
}
</style>