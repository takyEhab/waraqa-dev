<template>
  <div>
    <div class="text-center">
      <h3 class="f-color-3">Register</h3>
    </div>
    <form class="mt-5" @submit.prevent="register">
      <!-- User Type -->
      <div class="mt-3">
        <label class="f-color-3 mb-1">I am a</label>

        <!-- <div>
                  <div class="form-check">
                    <input
                      class="form-check-input"
                      type="checkbox"
                      value=""
                      id="flexCheckDefault"
                    />
                    <label class="form-check-label" for="flexCheckDefault">
                      Teacher
                    </label>
                  </div>
                  <div class="form-check">
                    <input
                      class="form-check-input"
                      type="checkbox"
                      value=""
                      id="flexCheckChecked"
                    />
                    <label class="form-check-label" for="flexCheckChecked">
                      Guardian
                    </label>
                  </div>
       </div> -->
        <div
          style="
            display: flex;
            justify-content: center;
            margin-left: 70px;
            margin-right: 70px;
          "
        >
          <button
            type="button"
            style="margin-right: 30px"
            :class="[
              userType == 'Teacher' ? 'btn-primary' : 'btn-secondary',
              'form-control',
              'btn',
              'with-100p',
              'f-color-0',
              'border-0',
              'py-2',
              'px-3',
              'rounded',
            ]"
            v-on:click="changeUserType('Teacher')"
          >
            Teacher
          </button>
          <button
            type="button"
            v-on:click="changeUserType('Guardian')"
            :class="[
              userType == 'Guardian' ? 'btn-primary' : 'btn-secondary',
              'form-control',
              'btn',
              'with-100p',
              'f-color-0',
              'border-0',
              'py-2',
              'px-3',
              'rounded',
            ]"
          >
            Guardian
          </button>
        </div>
        <!-- <div style="font-size: 25px; text-align: center">
        
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="inlineRadioOptions"
              id="inlineRadio1"
              v-model="userType"
              value="Teacher"
            />
             


            <label class="form-check-label" for="inlineRadio1">Teacher</label>
          </div>
          <div class="form-check form-check-inline">
            <input
              class="form-check-input"
              type="radio"
              name="inlineRadioOptions"
              id="inlineRadio2"
              v-model="userType"
              value="Guardian"
            />
            <label class="form-check-label" for="inlineRadio2">Guardian</label>
          </div>
        </div> -->

        <!-- <select class="form-select" v-model="userType" required>
          <option value="">Select User Type</option>
          <option>Guardian</option>
          <option>Teacher</option>
        </select> -->
      </div>
      <div v-if="userType" class="row flex-wrap">
        <!-- firstName -->
        <div class="col-12 col-md-6 mt-3">
          <input
            type="text"
            class="form-control"
            v-model="firstName"
            placeholder="First Name"
            required
          />
        </div>
        <!-- lastName -->
        <div class="col-12 col-md-6 mt-3">
          <input
            type="text"
            class="form-control"
            v-model="lastName"
            placeholder="Last Name"
            required
          />
        </div>
      </div>
      <!-- Email -->
      <div v-if="userType" class="mt-3">
        <input
          type="email"
          class="form-control"
          v-model="email"
          placeholder="Email"
          required
        />
      </div>
      <!-- Password -->
      <div v-if="userType" class="mt-3">
        <input
          type="password"
          class="form-control"
          v-model="password"
          placeholder="Passowrd"
          required
          pattern=".{8,}"
          title="Password can't be less then 8 characters"
        />
      </div>
      <!-- Phone Number -->
      <div v-if="userType" class="mt-3">
        <input
          type="tel"
          class="form-control"
          v-model="phone"
          placeholder="Phone Number"
          required
        />
      </div>
      <!-- Address -->
      <div v-if="userType" class="mt-3">
        <input
          type="text"
          class="form-control"
          v-model="address"
          placeholder="City, State and Country"
          required
        />
      </div>
      <!-- TimeZone -->
      <!-- <div class="mt-3">
                <label class="f-color-3 mb-1">TimeZone</label>
                <select class="form-select" v-model="timeZone" required>
                    <option value="">Select TimeZone</option>
                    <option v-for="timeZone in TimeZoneList" :key="timeZone.id" >{{timeZone}}</option>
                </select>
            </div> -->
      <!-- Contract -->
      <div v-if="userType == 'Teacher'" class="mt-3 align-items-center">
        <input type="checkbox" v-model="contractAgree" required />
        <small class="mx-2"
          >I agree to this
          <button
            type="button"
            data-bs-toggle="modal"
            data-bs-target="#contractModal"
            class="p-0"
            style="color: #0075ff; border: none; background-color: initial"
          >
            Contract.
          </button></small
        >
        <Contract :name="firstName + ' ' + lastName" />
      </div>
      <!-- Payments Policy -->
      <div v-if="userType == 'Guardian'" class="mt-3 align-items-center">
        <input type="checkbox" v-model="paymentsPolicy" required />
        <small class="mx-2"
          >I agree to this
          <button
            type="button"
            data-bs-toggle="modal"
            data-bs-target="#PaymentsPolicyModal"
            class="p-0"
            style="color: #0075ff; border: none; background-color: initial"
          >
            Payment and cancellation policy.
          </button></small
        >
        <PaymentsPolicy />
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
            <span v-else>Register</span>
          </div>
        </button>
        <!-- <input type="submit" class="main-button-style f-color-0 border-0 py-2 px-3 rounded" value="Register"> -->
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
</template>
<script>
import moment from "moment-timezone";
import axios from "axios";
import Tz from "@/components/Tz.json";
import Contract from "@/components/auth/register/Contract";
import PaymentsPolicy from "@/components/auth/register/PaymentsPolicy";
export default {
  components: {
    Contract,
    PaymentsPolicy,
  },
  data() {
    return {
      TimeZoneList: Tz,

      alerts: {
        success:
          "Great, You've completed the registration process successfully.",
        error: "",
      },
      loadingBtn: false,

      userType: "",
      firstName: null,
      lastName: null,
      email: null,
      password: null,
      phone: null,
      address: null,
      timeZone: moment.tz.guess(),

      contractAgree: false,
      paymentsPolicy: false,
    };
  },
  created() {
    this.alerts.success = "";
    this.alerts.error = "";
  },
  methods: {
    register() {
      this.alerts.success = "";
      this.alerts.error = "";
      this.loadingBtn = true;
      //Collect data
      let data = {
        userType: this.userType, // Will not stored.
        name: this.firstName + " " + this.lastName,
        email: this.email,
        password: this.password,
        phone: this.phone,
        address: this.address,
        timeZone: this.timeZone,
      };
      // Send Data
      let postUrl = "http://localhost:3300/auth/v1/path0";
      axios
        .post(postUrl, data)
        .then((res) => {
          if (res.data.success) {
            this.loadingBtn = false;
            return (this.alerts.success =
              "Great, you've completed the registration process successfully.");
          }
          this.alerts.error = res.data.msg;
          this.loadingBtn = false;
        })
        .catch(() => {
          this.loadingBtn = false;
          return (this.alerts.error = "Sorry, failed to register!");
        });
    },
    changeUserType(type) {
      this.userType = type;
    },
  },
};
</script>
