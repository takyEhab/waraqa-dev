<template>
  <div v-if="displayData" class="information">
    <div class="f-color-1">
      <small
        class="text-on-hover"
        @click="$router.push({ name: 'AdminBillsMain', params: $route.params })"
        ><i class="fas fa-long-arrow-alt-left"></i> Back</small
      >
    </div>
    <div>
      <!-- Avatar and Edit  -->
      <div class="mt-5 d-flex justify-content-end">
        <!-- Avatar -->
        <!-- Edit -->
        <div
          class="edit"
          data-bs-toggle="modal"
          data-bs-target="#EditInvoiceModal"
        >
          <i class="fas fa-edit"></i>
        </div>
        <div style="margin-left: 15px" class="edit" @click="deleteData">
          <i class="fas fa-trash"></i>
        </div>
        <Edit
          :invoiceID="invoiceID"
          :totalHours="totalHours"
          :classesIDs="classesIDs"
        />
      </div>
      <!-- Main Information :  -->
      <div>
        <div class="col-12 col-md-3 mb-2">
          <span class="d-block f-color-2">Main Information :</span>
        </div>
        <div class="row flex-wrap">
          <div
            class="mt-3 col-12 col-md-6 col-lg-4 d-flex justify-content-between"
          >
            <small class="info-title">Guardian :</small>
            <span class="info-content">{{ data[0].guardianName }}</span>
          </div>
          <div
            class="mt-3 col-12 col-md-6 col-lg-4 d-flex justify-content-between"
          >
            <small class="info-title">Invoice number :</small>
            <span class="info-content">{{
              data[0].invoiceNumber ? data[0].invoiceNumber : "Not Selected"
            }}</span>
          </div>
          <div
            class="mt-3 col-12 col-md-6 col-lg-4 d-flex justify-content-between"
          >
            <small class="info-title">Invoice date :</small>
            <span class="info-content">{{
              moment(data[0].activatedAt).format("ddd, D MMM YYYY")
            }}</span>
          </div>
          <div
            class="mt-3 col-12 col-md-6 col-lg-4 d-flex justify-content-between"
          >
            <small class="info-title">Transfer fess :</small>
            <span class="info-content">{{
              data[0].transferFess ? data[0].transferFess : 0
            }}</span>
          </div>
          <div
            class="mt-3 col-12 col-md-6 col-lg-4 d-flex justify-content-between"
          >
            <small class="info-title">Extra amount :</small>
            <span class="info-content">{{
              data[0].extraAmount ? data[0].extraAmount : 0
            }}</span>
          </div>
          <div
            class="mt-3 col-12 col-md-6 col-lg-4 d-flex justify-content-between"
          >
            <small class="info-title">Number of paid hours :</small>
            <span class="info-content">{{
              data[0].savedPaidHours ? data[0].savedPaidHours / 60 : 0
            }}</span>
          </div>
          <div
            class="mt-3 col-12 col-md-6 col-lg-4 d-flex justify-content-between"
          >
            <small class="info-title">Total amount paid :</small>
            <span class="info-content">{{
              data[0].totalAmountPaid ? data[0].totalAmountPaid : 0
            }}</span>
          </div>
          <div
            class="mt-3 col-12 col-md-6 col-lg-4 d-flex justify-content-between"
          >
            <small class="info-title">Payment method :</small>
            <span class="info-content">{{
              data[0].paymentMethod == 0
                ? "Not Selected"
                : data[0].paymentMethod == 1
                ? "PayPal"
                : data[0].paymentMethod == 2
                ? "Bank account"
                : data[0].paymentMethod == 3
                ? "Ria"
                : data[0].paymentMethod == 4
                ? "Western Union"
                : "Other"
            }}</span>
          </div>
          <div
            class="mt-3 col-12 col-md-6 col-lg-4 d-flex justify-content-between"
          >
            <small class="info-title">Payment date :</small>
            <span class="info-content">{{
              data[0].paymentDate
                ? moment(data[0].paymentDate).format("ddd, D MMM YYYY")
                : "Not Selected"
            }}</span>
          </div>
        </div>
      </div>
      <!-- Paid status -->
      <div
        v-if="data[0].paid != 1"
        class="mt-4 col-12 col-md-4 f-color-4 b-color-4_1 py-1 px-2"
      >
        This invoice has not yet been paid.
      </div>
      <!-- Classes that must be paid -->
      <div class="b-color-0 box-shadow-style mt-4">
        <div class="d-flex justify-content-end align-items-center flex-wrap">
          <div class="col-12 col-md-2 f-color-1 px-md-3 text-md-end">
            <span>Total hours: {{ (totalHours / 60).toFixed(2) }}</span>
            <br />
            <span class="pt-4"
              >Total fees:
              {{
                data[0].hoursPrice
                  ? (
                      (totalHours / 60) * data[0].hoursPrice +
                      data[0].transferPrice
                    ).toFixed(2)
                  : "Null"
              }}</span
            >
          </div>
        </div>
        <!-- Table -->
        <div
          v-if="data[0].paymentType == 1"
          class="mt-4 b-color-0 box-shadow-style py-3"
          style="overflow: hidden; overflow-x: auto"
        >
          <div style="min-width: 62em">
            <div class="px-2 table-colums f-color-1 d-flex mb-4">
              <small class="col-2">Student</small>
              <small class="col-2">Teacher</small>
              <small class="col-1">Class title</small>

              <small class="col-2">Class subject</small>
              <small class="col-1">Status</small>
              <small class="col-1">Duration</small>
              <small class="col-1">Info</small>
              <small class="col-1">count</small>
              <small class="col-1">Date</small>
            </div>
            <div
              v-for="anClass in classes"
              :key="anClass.id"
              class="table-row py-3"
            >
              <div class="px-2 d-flex f-color-3">
                <small class="col-2">{{ anClass.studentName }}</small>
                <small class="col-2">{{ anClass.teacherName }}</small>
                <small class="col-1">{{ anClass.classTitle }}</small>

                <small class="col-2">{{ anClass.subject }}</small>

                <small class="col-1">{{
                  anClass.status == 1
                    ? "Attended"
                    : anClass.status == 4
                    ? "Missed by student"
                    : anClass.status == 0
                    ? "Active"
                    : anClass.status
                }}</small>
                <small class="col-1">{{ anClass.duration }}</small>
                <small class="col-1">
                  <router-link
                    :to="{ name: 'ClassInfo', params: { id: anClass.id } }"
                    class="f-color-1"
                    ><i class="fas fa-eye"></i
                  ></router-link>
                </small>
                <small class="col-1">
                  <div
                    @click="
                      changeCount(anClass.id, parseInt(anClass.countOnInvoice))
                    "
                    class="f-color-1"
                  >
                    <i
                      :class="[
                        parseInt(anClass.countOnInvoice) === 1
                          ? 'fas fa-minus'
                          : 'fas fa-plus',
                        'col-2',
                      ]"
                    ></i>
                  </div>
                </small>
                <small class="col-1">{{
                  moment(anClass.startingDate).format("ddd, D MMM YYYY HH:mm")
                }}</small>
              </div>
            </div>
          </div>
        </div>
        <!-- Table -->
        <div
          v-else-if="data[0].paymentType == 2"
          class="mt-4 b-color-0 box-shadow-style py-3"
          style="overflow: hidden; overflow-x: auto"
        >
          <div style="min-width: 62em">
            <div class="px-2 table-colums f-color-1 d-flex mb-4">
              <small class="col-2">Student</small>
              <small class="col-2">Teacher</small>
              <small class="col-2">Class title</small>
              <small class="col-2">Class subject</small>
              <small class="col-2">Status</small>
              <small class="col-2">Date</small>
            </div>
            <div
              v-for="anClass in classes"
              :key="anClass.id"
              class="table-row py-3"
            >
              <div class="px-2 d-flex f-color-3">
                <small class="col-2">{{ anClass.studentName }}</small>
                <small class="col-2">{{ anClass.teacherName }}</small>
                <small class="col-2">{{ anClass.classTitle }}</small>
                <small class="col-2">{{ anClass.subject }}</small>
                <small
                  :class="[
                    anClass.status == 1 ? 'f-color-1' : 'f-color-4',
                    'col-2',
                  ]"
                >
                  {{
                    anClass.status == 1
                      ? "Attended"
                      : anClass.status == 4
                      ? "Missed by student"
                      : anClass.status
                  }}
                </small>
                <small class="col-2">{{
                  moment(anClass.startingDate).format("ddd, D MMM YYYY HH:mm")
                }}</small>
              </div>
            </div>
          </div>
        </div>
      </div>
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
  </div>
</template>

<script>
import axios from "axios";
import moment from "moment";
import Edit from "@/components/admin/sections/bills/guardians/Edit";
export default {
  components: { Edit },
  data() {
    return {
      displayData: false,
      loadingBtn: false,
      alerts: {
        success: null,
        error: null,
      },
      invoiceID: null,
      data: [],
      classes: [],
      classesIDs: null,
      totalHours: 0,
    };
  },
  methods: {
    moment(date) {
      return moment(date);
    },
    changeCount(classID, CurrentCountOnInvoice) {
      let url = `http://localhost:3300/api/v1/admin/bills/path11/${classID}`;
      axios
        .patch(url, { CurrentCountOnInvoice })
        .then(() => {
          const objIndex = this.classes.findIndex((item) => item.id == classID);
          this.classes[objIndex].countOnInvoice =
            CurrentCountOnInvoice === 1 ? 2 : 1;
          this.getData();
        })
        .catch((err) => console.log(err));
    },
    getData() {
      let url = `http://localhost:3300/api/v1/admin/bills/path2/${this.invoiceID}`;
      axios
        .get(url)
        .then((res) => {
          if (!res.data.success) {
            this.$router.push("/admin/bills");
            return (this.alerts.error = res.data.msg);
          }
          this.alerts.error = null;
          this.data = res.data.rows;
          this.data[0].paymentMethod = this.data[0].paymentMethod
            ? this.data[0].paymentMethod
            : 0;
          if (this.data[0].payFor) {
            this.getPayEveryClasses();
          } else if (this.data[0].paymentType == 1) {
            this.getPrepaidClasses();
          } else if (this.data[0].paymentType == 2) {
            this.getPostPaidClasses();
          }

          this.displayData = true;
        })
        .catch(() => {
          console.log("Invoice Info/Error catched");
        });
    },
    getPayEveryClasses() {
      let url = `http://localhost:3300/api/v1/admin/bills/guardian/path10/${this.invoiceID}`;
      axios
        .get(url)
        .then((res) => {
          if (!res.data.success) {
            // this.$router.push('/admin/bills');
            return (this.alerts.error = res.data.msg);
          }
          this.alerts.error = null;
          this.classes = res.data.rows;

          this.totalHours = 0; // Re-Inisialization
          this.classes.forEach((row) => {
            if (parseInt(row.countOnInvoice) === 1)
              this.totalHours += row.duration;
          });

          ///
          let ids = [];
          let arrayOfObject = this.classes;

          for (let i in arrayOfObject) {
            ids.push(arrayOfObject[i].id);
          }
          this.classesIDs = ids.join(",");

          ///
        })
        .catch(() => {
          console.log("Invoice Info/Error catched");
        });
    },
    getPrepaidClasses() {
      let url = `http://localhost:3300/api/v1/admin/bills/path3/${this.invoiceID}`;
      axios
        .get(url)
        .then((res) => {
          if (!res.data.success) {
            // this.$router.push('/admin/bills');
            return (this.alerts.error = res.data.msg);
          }
          this.alerts.error = null;
          this.classes = res.data.rows;

          let invoiceHours = this.data[0].savedPaidHours;
          this.classes = this.classes.filter((row) => {
            if (parseInt(row.countOnInvoice) === 1)
              invoiceHours -= row.duration;
            return invoiceHours >= 0;
          });
          this.totalHours = 0; // Re-Inisialization
          this.classes.forEach((row) => {
            if (parseInt(row.countOnInvoice) === 1)
              this.totalHours += row.duration;
          });
          ///
          let ids = [];
          let arrayOfObject = this.classes;

          for (let i in arrayOfObject) {
            ids.push(arrayOfObject[i].id);
          }
          this.classesIDs = ids.join(",");
          let url = `http://localhost:3300/api/v1/admin/bills/path4/${this.invoiceID}`;
          axios.post(url, {
            classesIDs: this.classesIDs,
            paid: this.data[0].paid,
          });
        })
        .catch(() => {
          console.log("Invoice Info/Error catched");
        });
    },
    getPostPaidClasses() {
      let url = `http://localhost:3300/api/v1/admin/bills/path5/${this.invoiceID}`;
      let queryReq = {
        params: { InvoiceActivatedAt: this.data[0].activatedAt },
      };

      axios
        .get(url, queryReq)
        .then((res) => {
          if (!res.data.success) {
            // this.$router.push('/admin/bills');
            return (this.alerts.error = res.data.msg);
          }
          this.alerts.error = null;
          this.classes = res.data.rows;
          this.totalHours = 0; // Re-Inisialization
          this.classes.forEach((row) => {
            if (parseInt(row.countOnInvoice) === 1)
              this.totalHours += row.duration;
          });

          ///
          let ids = [];
          let arrayOfObject = this.classes;

          for (let i in arrayOfObject) {
            ids.push(arrayOfObject[i].id);
          }
          this.classesIDs = ids.join(",");

          ///
        })
        .catch(() => {
          console.log("Invoice Info/Error catched");
        });
    },
    deleteData() {
      this.alerts.error = null;
      this.alerts.success = null;
      if (window.confirm("Are you sure you want to delete this Invoice?")) {
        axios
          .delete(
            `http://localhost:3300/api/v1/admin/bills/guardian/path6/${this.invoiceID}`
          )
          .then((res) => {
            if (!res.data.success) {
              console.log(res.data);
              return (this.alerts.error = res.data.msg);
            }
            this.alerts.success = res.data.msg;
            this.$router.push("/admin/bills");
          });
      }
    },
  },
  created() {
    this.invoiceID = this.$route.params.id;
    this.getData();
  },
};
</script>
<style>
.circle-Add {
  color: var(--color-4);
  background-color: var(--color-4_1);
  width: 30px;
  height: 30px;
  display: flex;
  justify-content: center;
  align-items: center;
  font-size: 11px;
  border-radius: 50%;
  opacity: 0.8;
}
.circle-Add:hover,
.circle-Add:focus {
  color: var(--color-4_1);
  background-color: var(--color-4);
  opacity: 1;
  transition: 0.2s ease-in-out;
}
.active-star {
  color: rgb(255, 186, 58);
}
</style>
