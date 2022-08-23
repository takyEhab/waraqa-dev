<template>
  <div
    v-if="displayData"
    class="modal fade"
    id="EditInvoiceModal"
    tabindex="-1"
    aria-labelledby="exampleModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog custom-with-modal-dialog">
      <div class="modal-content text-start">
        <header
          class="b-color-2 f-color-0 py-3 px-4 d-flex justify-content-between"
        >
          <h5 class="m-0">Add a student in Wait-list</h5>
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
          <form class="mt-1" @submit.prevent="updateInvoice">
            <!-- Status & Cancelation requests -->
            <div class="row flex-wrap">
              <!-- Status -->
              <div class="col-12 col-md mt-3">
                <label class="f-color-3 mb-1">Status</label>
                <select class="form-select" v-model="data.paid" required>
                  <option value="">Select status</option>
                  <option value="1">Paid</option>
                  <option value="2">Unpaid</option>
                </select>
              </div>
              <!-- Payment date -->
              <div class="col-12 col-md-6 mt-3">
                <label class="f-color-3 mb-1">Payment date</label>
                <input
                  type="date"
                  class="form-control"
                  v-model="data.paymentDate"
                  required
                />
                <!-- Cancelation requests -->
                <div class="col-12 col-md mt-3">
                  <label class="f-color-3 mb-1">Cancelation requests</label>
                  <input
                    type="number"
                    class="form-control"
                    placeholder="Cancelation Requests"
                    v-model="cancelationReqValue"
                  />
                </div>
              </div>
              <!-- Bonus & paidHours -->
              <div class="row flex-wrap">
                <!-- Bonus -->
                <div class="col-12 col-md mt-3">
                  <label class="f-color-3 mb-1">Bonus</label>
                  <input
                    type="number"
                    class="form-control"
                    placeholder="Bonus"
                    v-model="bonusValue"
                  />
                </div>
                <!-- paidHours -->
                <div class="col-12 col-md mt-3">
                  <label class="f-color-3 mb-1">Teaching Hours</label>
                  <input
                    type="number"
                    class="form-control"
                    placeholder="Teaching Hours"
                    v-model="hoursCalculted"
                    required
                  />
                </div>
              </div>
              <!-- Total amount paid & Payment method -->
              <div class="row flex-wrap">
                <!-- Total amount paid -->
                <div class="col-12 col-md mt-3">
                  <label class="f-color-3 mb-1">Salary</label>
                  <input
                    type="number"
                    class="form-control"
                    placeholder="Salary"
                    v-model="data.totalAmountPaid"
                    required
                  />
                </div>
                <!-- Payment method -->
                <div class="col-12 col-md mt-3">
                  <label class="f-color-3 mb-1">Payment method</label>
                  <input
                    type="number"
                    class="form-control"
                    v-model="data.paymentMethod"
                    required
                  />
                </div>
              </div>
              <!-- Payment date : & Invoice Number -->
              <div class="row flex-wrap">
                <div class="col-12 col-md-6 mt-3">
                  <label class="f-color-3 mb-1">Invoice Number</label>
                  <input
                    type="number"
                    class="form-control"
                    placeholder="Invoice Number"
                    v-model="data.invoiceNumber"
                    required
                  />
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
import axios from "axios";
import moment from "moment";
export default {
  props: ["invoiceID", "totalHours", "autoCancelationReq", "autoBonus"],
  data() {
    return {
      displayData: false,
      loadingBtn: false,
      alerts: {
        success: null,
        error: null,
      },
      data: [],
    };
  },
  methods: {
    getData() {
      let url = `http://localhost:3300/api/v1/admin/bills/path7/${this.invoiceID}`;
      axios
        .get(url)
        .then((res) => {
          if (!res.data.success) {
            this.$router.push("/admin/bills");
            return (this.alerts.error = res.data.msg);
          }
          this.alerts.error = null;
          this.data = res.data.rows[0];
          this.data.paymentDate = moment(this.data.paymentDate).format(
            "YYYY-MM-DD"
          );
          this.hoursCalculted = this.data.paidHours
            ? this.data.paidHours / 60
            : this.totalHours / 60;
          this.cancelationReqValue = this.data.cancelationReq
            ? this.data.cancelationReq
            : this.autoCancelationReq
            ? this.autoCancelationReq
            : 0;
          this.bonusValue = this.data.bonus
            ? this.data.bonus
            : this.autoBonus
            ? this.autoBonus
            : 0;

          this.displayData = true;
        })
        .catch(() => {
          console.log("Invoice Info/Error catched");
        });
    },
    updateInvoice() {
      this.alerts.error = "";
      this.alerts.success = "";
      this.loadingBtn = true;

      this.data.paidHours = this.hoursCalculted * 60; //Save as minutes
      this.data.cancelationReq = this.cancelationReqValue;
      this.data.bonus = this.bonusValue;

      let url = `http://localhost:3300/api/v1/admin/bills/path9/${this.invoiceID}`;
      axios
        .post(url, this.data)
        .then((res) => {
          if (!res.data.success) {
            this.loadingBtn = false;
            return (this.alerts.error = res.data.msg);
          }
          this.alerts.success = res.data.msg;
          this.$parent.getData();
          this.loadingBtn = false;
        })
        .catch(() => {
          console.log("Error catched");
          this.loadingBtn = false;
        });
    },
  },
  created() {
    this.getData();
  },
};
</script>
