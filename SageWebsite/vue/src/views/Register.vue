<template>
  <div id="container">
    <div id="register" class="text-center register-body">
      <form @submit.prevent="register" class="registerDiv">
        <div id="title">
          <h2>Create Account</h2>
        </div>
        <div id="alert" role="alert" v-if="registrationErrors">
          {{ registrationErrorMsg }}
        </div>
        <div id="form-container">
          <div class="form-input-group">
            <label for="username">Username: </label>
            <input
              type="text"
              id="username"
              class="inputbox"
              v-model="user.username"
              required
              autofocus
            />
          </div>
          <div class="form-input-group">
            <label for="password">Password: </label>
            <input
              type="password"
              class="inputbox"
              id="password"
              v-model="user.password"
              required
            />
          </div>
          <div class="form-input-group">
            <label for="confirmPassword">Confirm Password:</label>
            <input
              type="password"
              id="confirmPassword"
              class="inputbox"
              v-model="user.confirmPassword"
              required
            />
          </div>
        </div>

        <div id="bottom">
          <button type="submit">Create Account</button>
        </div>
        <div class="login-link">
          <p id="login-link">
            Already have an account?
            <router-link :to="{ name: 'login' }"> Log in.</router-link>
          </p>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "register",
  data() {
    return {
      user: {
        username: "",
        password: "",
        confirmPassword: "",
        role: "user",
      },
      registrationErrors: false,
      registrationErrorMsg: "There were problems registering this user.",
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = "Password & Confirm Password do not match.";
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: "/login",
                query: { registration: "success" },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = "Bad Request: Validation Errors";
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = "There were problems registering this user.";
    },
  },
};
</script>

<style scoped>
label {
  margin-right: 0.5rem;
}

h2 {
  border-bottom: none;
  background: none;
  position: relative;
  left: 30%;
  padding-bottom: 30px;
}
.register-body {
  position: relative;
  background: #fff;
  border-radius: 30px;
  border: 2px solid #333;
  min-width: 30rem;
  height: auto;
  margin: 1rem 2rem;
  padding: 2rem 3rem 2rem 2rem;
  width: 50%;
  display: flex;
  justify-content: center;
  text-align: center;
  margin-top: 3rem;
}

.registerDiv a {
  color: #333;
}

#sign-up a {
  color: #333;
  font-family: "Montserrat";
}

.title-servings-combo a {
  color: #333;
  font-family: "Montserrat";
}

#container {
  display: flex;
  justify-content: center;
}

p a {
  color: #333;
  font-family: "Montserrat";
  text-decoration: none;
}

#bottom {
  display: flex;
  justify-content: center;
}

#form-container {
  justify-content: center;
}
</style>
