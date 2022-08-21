<template>
  <div
    class="modal fade"
    id="CreateInvoiceModal"
    tabindex="-1"
    aria-labelledby="exampleModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog">
      <div class="modal-content text-start">
        <header
          class="b-color-2 f-color-0 py-3 px-4 d-flex justify-content-between"
        >
          <h5 class="m-0">Create Invoice</h5>
          <button
            type="button"
            class="f-color-0 border-0 background-none"
            data-bs-dismiss="modal"
            aria-label="Close"
          >
            <i class="fas fa-times"></i>
          </button>
        </header>
        <div class="mt-3 px-3 px-md-5 py-5">
          <!-- Form -->
          <form class="mt-1" @submit.prevent="createInvoice">
            <div class="row flex-wrap">
              <!-- Status -->
              <div class="col-12 col-md">
                <label class="f-color-3 mb-1">Status</label>
                <select class="form-select" required>
                  <option value="">Select status</option>
                  <option value="1">Paid</option>
                  <option value="2">Unpaid</option>
                </select>
              </div>
              <div class="col-12 col-md">
                <label class="f-color-3 mb-1">Guardian</label>

                <v-select
                  :options="guardians"  
                  label="name"
                  :reduce="(guardian) => guardian.id"
                  v-model="guardianID"
                  placeholder="Select Guardian"
                />

              </div>
            </div>
            <!-- Extra amount & paidHours -->
            <div class="row flex-wrap">
              <!-- Extra amount -->
              <div class="col-12 col-md mt-3">
                <label class="f-color-3 mb-1">Extra amount</label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Enter Extra amount"
                />
              </div>
              <!-- paidHours -->
              <div class="col-12 col-md mt-3">
                <label class="f-color-3 mb-1">Paid Hours</label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Enter Paid Hours"
                  required
                />
              </div>
            </div>
            <!-- Total amount paid & Payment method -->
            <div class="row flex-wrap">
              <!-- Total amount paid -->
              <div class="col-12 col-md mt-3">
                <label class="f-color-3 mb-1">Total amount paid</label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Edit total amount paid"
                  required
                />
              </div>
              <!-- Payment method -->
              <div class="col-12 col-md mt-3">
                <label class="f-color-3 mb-1">Payment method</label>

                <select class="form-select" required>
                  <option value="0">Not selected</option>
                  <option value="1">PayPal</option>
                  <option value="2">Bank account</option>
                  <option value="3">Ria</option>
                  <option value="4">Western Union</option>
                  <option value="5">Other</option>
                </select>
              </div>
            </div>
            <!-- Invoice Number & Payment date -->
            <div class="row flex-wrap">
              <!-- Payment date -->
              <div class="col-12 col-md-6 mt-3">
                <label class="f-color-3 mb-1">Starting Date</label>
                <input type="date" class="form-control" required />
              </div>

              <!-- Invoice Number -->
              <div class="col-12 col-md mt-3">
                <label class="f-color-3 mb-1">Paid for</label>
                <input
                  type="number"
                  class="form-control"
                  placeholder="Months"
                  required
                  min="1"
                  v-model="payEvery"
                />
              </div>
            </div>

            <div class="row flex-wrap">
              <div class="col-12 col-md-6 mt-3">
                <label class="f-color-3 mb-1">Invoice Number</label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Enter the Invoice number"
                  required
                />
              </div>
              <!-- Transfer Fees -->
              <div class="col-12 col-md mt-3">
                <label class="f-color-3 mb-1">Transfer Fees</label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Transfer Fess"
                />
              </div>
              <!-- sent -->
            </div>

            <div class="mt-2">
              <div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="flexCheckDefault"
                  />
                  <label class="form-check-label" for="flexCheckDefault">
                    Sent
                  </label>
                </div>
              </div>
            </div>
            <!-- Submit -->
            <div class="mt-4 text-end">
              <button
                :disabled="loadingBtn"
                type="submit"
                class="main-button-style with-100px f-color-0 border-0 py-2 px-3 rounded"
              >
                <div>
                  <span
                    v-if="loadingBtn"
                    class="spinner-grow spinner-grow-sm mx-2"
                    role="status"
                    aria-hidden="true"
                  ></span>
                  <span v-else>Update</span>
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
<script>
import moment from "moment-timezone";
import axios from "axios";
import vSelect from "vue-select";
import "vue-select/dist/vue-select.css";

export default {
  components: {
    vSelect,
  },
  data() {
    return {
      loadingBtn: false,
      alerts: {
        success: null,
        error: null,
      },
      guardians: [],
guardianID:null
    };
  },
  methods: {
    moment(date) {
      return moment(date);
    },
    createInvoice() {
      this.alerts.error = "";
      this.alerts.success = "";
      this.loadingBtn = true;
      let url = "http://localhost:3300/api/v1/admin";
      axios
        .post(url, {
          // data: this.startingRescheduled,
          data: this.startingRescheduled,
        })
        .then((res) => {
          if (!res.data.success) {
            this.loadingBtn = false;
            return (this.alerts.error = res.data.msg);
          }
          console.log(res.data);
          this.alerts.success = res.data.msg;
          this.loadingBtn = false;
        })
        .catch(() => {
          console.log("Error catched");
          this.loadingBtn = false;
        });
    },
    fetchGuardians() {
      //Uses in AddEvaluation modal
      let url = "http://localhost:3300/api/v1/admin/guardians/path0";
      axios
        .get(url, { params: { status: 1 } })
        .then((res) => {
          this.guardians = res.data.rows;
        })
        .catch(() => {
          console.log("Error catched");
        });
    },
  },
  created() {
    this.fetchGuardians();
  },
};
</script>
<style scoped>
@media (min-width: 576px) {
  .modal-dialog {
    max-width: 60%;
  }
}

.style-chooser .vs__search::placeholder,
.style-chooser .vs__dropdown-toggle,
.style-chooser .vs__dropdown-menu {
  background: #dfe5fb;
  border: none;
  color: #394066;
  text-transform: lowercase;
  font-variant: small-caps;
}

.style-chooser .vs__clear,
.style-chooser .vs__open-indicator {
  fill: #394066;
}
</style>