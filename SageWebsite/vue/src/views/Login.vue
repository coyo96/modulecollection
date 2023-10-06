<template>
<div id="container">
  <div id="login" class="login-body">
    <form @submit.prevent="login" class = "loginDiv">
      <h2 id="title" >Please Sign In</h2><br/>
      <div id= "alert" role="alert" v-if="invalidCredentials">
        Invalid username and password!
      </div>
      <div role="alert" v-if="this.$route.query.registration">
        Thank you for registering, please sign in.
      </div>
      <div class="form-input-group">
        <label for="username">Username: </label>
        <input 
          type="text"
          id="username" class="inputbox" 
          v-model="user.username"
          required
          autofocus
        />
      </div>
      <div class="form-input-group">
        <label for="password">Password: </label>
        <input type="password" id="password" v-model="user.password" class="inputbox" required />
      </div>
      <button type="submit" class="login-btn">Login</button>
      <p id="sign-up">
        Need an account?
        <router-link :to="{ name: 'register' }"> Sign up.</router-link>
      </p>
    </form>
  </div>
</div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: "",
      },
      invalidCredentials: false,
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then((response) => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch((error) => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
  },
};
</script>

<style scoped>



.login-body {
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
  width: 50%
}

.loginDiv a {
  color: #333;
}


#sign-up a {
  color: #333;
  font-family: "Montserrat";
}

#sign-up{
  font-family: "Montserrat";
}

#sign-up a:hover {
  color: green;
  font-family: "Montserrat";
}

#alert{
  color:red;
  font-family: "Montserrat";
  display: flex;
  justify-content: center;
  padding-bottom: .5rem;
}

h2{
  text-decoration:none;
  border-bottom: none;
  background: transparent;
}

#title{
  text-align: center;
  width:100%;
}

</style>