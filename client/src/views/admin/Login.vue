<template>
  <div class="container my-5">
    <div class="d-flex flex-wrap">
      <!-- SideBar Info -->
      <div
        class="col-12 col-md-4 d-flex justify-content-between flex-column b-color-1 z-index-1 f-color-2 px-4 py-5"
        style="min-height: 25em; border-radius: 35px 0px 0px 35px"
      >
        <header class="text-center">
          <img
            src="@/assets/logo.jpg"
            alt="waraqa logo"
            classs="img-fluid"
            style="width: 170px"
          />
        </header>
        <article class="text-center f-color-0">
          <h4>Log In</h4>
        </article>
        <footer class="text-center media">
          <!-- Social Media -->
          <a class="px-3" href="#"><i class="px-2 fab fa-facebook-f"></i></a>
          <a class="px-3" href="#"><i class="fab fa-twitter"></i></a>
          <a class="px-3" href="#"><i class="fab fa-linkedin-in"></i></a>
          <a class="px-3" href="#"><i class="pr-1 fab fa-instagram"></i></a>
        </footer>
      </div>
      <!-- Form -->
      <div
        style="border-radius: 0px 35px 35px 0px"
        class="col-12 col-md-8 mt-4 mt-md-0 b-color-0 d-flex justify-content-center py-5 px-md-5 box-shadow-style"
      >
        <div class="col-11 col-md-10">
          <!-- Login -->
          <div class="text-center">
            <h3 class="f-color-3">Log In</h3>
          </div>
          <form class="mt-5" @submit.prevent="login">
            <!-- Email -->
            <div class="mt-3">
              <label class="f-color-3 mb-1">Email</label>
              <!--/ Phone Number-->
              <input
                type="email"
                v-model="email"
                class="form-control"
                placeholder="Enter your Email"
                style="border-radius: 35px"
                required
              />
            </div>
            <!-- Password -->
            <div class="mt-3">
              <label class="f-color-3 mb-1">Passowrd</label>
              <input
                type="password"
                style="border-radius: 35px"
                v-model="password"
                class="form-control"
                placeholder="Enter your Passowrd"
                required
              />
            </div>
            <!-- Forget Password -->
            <div class="mt-3">
              <span
                ><button
                  class="forgetPass p-0"
                  type="button"
                  data-bs-toggle="modal"
                  data-bs-target="#forgetPass"
                >
                  Forget Password ?
                </button></span
              >
              <ForgetPass userType='admin' />
            </div>
            <!-- Submit -->
            <div class="mt-4 text-end">
              <button
                :disabled="loadingBtn"
                type="submit"
                class="main-button-style f-color-0 border-0 py-2 px-3 rounded"
              >
                <div>
                  <span
                    v-if="loadingBtn"
                    class="spinner-grow spinner-grow-sm mx-2"
                    role="status"
                    aria-hidden="true"
                  ></span>
                  <span v-else>Log In</span>
                </div>
              </button>
            </div>
            <!-- Alerts -->
            <div class="mt-4">
              <div
                v-if="alerts.success"
                class="text-center alert text-center alert-success"
              >
                {{ alerts.success }}
              </div>
              <div
                v-else-if="alerts.error"
                class="text-center alert text-center alert-warning"
              >
                {{ alerts.error }}
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
<style>
.forgetPass {
  color: var(--color-3_3);
  border: none;
  background-color: initial;
}
.forgetPass:hover {
  color: var(--color-3);
  transition: 0.2s ease-in-out;
}
</style>
<script>
import axios from "axios";
import ForgetPass from "@/components/auth/login/ForgetPass";
export default {
  components: {
    ForgetPass,
  },
  data() {
    return {
      loadingBtn: false,
      alerts: {
        success: null,
        error: null,
      },
      email: null,
      password: null,
    };
  },
  methods: {
    login() {
      this.alerts.error = "";
      this.alerts.success = "";
      this.loadingBtn = true;

      let data = {
        email: this.email,
        password: this.password,
      };

      let url = "http://localhost:3300/auth/v1/path10";
      axios
        .post(url, data)
        .then((res) => {
          if (!res.data.success) {
            this.loadingBtn = false;
            return (this.alerts.error = res.data.msg);
          }
          localStorage.setItem("waraqaPanelToken", res.data.token);
          //Login  > Index
          this.$parent.setAuthorized();

          // Empty inputs
          // this.email = "";
          // this.password = ""
          this.loadingBtn = false;
        })
        .catch(() => {
          this.loadingBtn = false;
          return (this.alerts.error = "Soory, failed login!");
        });
    },
  },
};
</script>
