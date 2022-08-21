<template>
  <div>
    <!--Search -->
    <div class="mt-4 d-flex justify-content-md-end flex-wrap">
      <!-- Search -->
      <div class="col-12 col-md-4">
        <div class="d-flex position-relative align-items-center">
          <input
            type="text"
            class="form-control"
            v-model="search"
            @keyup="getData()"
            placeholder="Search by class title or id"
          />
          <div
            class="f-color-1 rounded px-3 position-absolute py-1"
            style="right: 7px"
          >
            <small><i class="fas fa-search"></i></small>
          </div>
        </div>
      </div>
    </div>

    <!-- Alerts -->
    <div class="mt-4">
      <div
        v-if="alerts.success"
        class="text-start text-md-center alert text-center alert-success"
      >
        {{ alerts.success }}
      </div>
      <div
        v-else-if="alerts.error"
        class="text-start text-md-center alert text-center alert-warning"
      >
        {{ alerts.error }}
      </div>
    </div>

    <!-- Table -->
    <div
      class="mt-4 b-color-0 box-shadow-style px-md-2 py-3"
      style="overflow: hidden; overflow-x: auto"
    >
      <div style="min-width: 62em">
        <div class="px-2 table-colums f-color-3_3 d-flex mb-4">
          <small class="col-3">Date</small>
          <small class="col-2">Student</small>
          <small class="col-2">Teacher</small>
          <small class="col-2">Subject</small>
          <small class="col-2">Duration</small>
          <small class="col-1">More</small>
        </div>
        <div v-for="row in data" :key="row.id">
          <div class="table-row py-3">
            <div
              :class="[
                Math.abs(moment().diff(row.startingDate, 'hours')) < 24
                  ? 'nextClasses'
                  : 'f-color-3',
                'px-4 d-flex',
              ]"
            >
              <span class="col-3" >
                <span
                  style="margin-left: 35px; font-weight: 900; color: #4c4a4c"
                >
                  {{ moment(row.startingDate).format("hh:mm A") }}
                </span>
                <br />
                {{ moment(row.startingDate).format("ddd, MMM D, YYYY") }}
              </span>

              <span class="col-2">{{ row.studentName }}</span>
              <span class="col-2">{{ row.teacherName }}</span>
              <span class="col-2">{{ row.subject }}</span>

              <span class="col-2">{{ row.duration }} m</span>

              <!--             
            <div class="col-1">
              <router-link
                :to="{ name: 'ClientClassInfo', params: { id: row.id } }"
                 :class="[
              Math.abs(moment().diff(row.startingDate, 'hours')) < 24
                ? 'f-color'
                : 'f-color-1',
            ]"
                ><i class="fas fa-eye"></i
              ></router-link>
            </div> -->

              <div class="col-1">
                <!-- Example single danger button -->
                <div class="btn-group dropstart">
                  <!-- <i data-bs-toggle="dropdown" class=" fa-2x fa fa-caret-down"></i> -->
                  <div data-bs-toggle="dropdown" class="btn">
                    <i class="fa fa-lg fa-ellipsis-v"></i>
                  </div>

                  <!-- Action -->
                  <ul class="dropdown-menu">
                    <li>
                      <router-link
                        :to="{
                          name: 'ClientClassInfo',
                          params: {
                            id: row.id,
                            tap: false,
                            page: pagination.page,
                            offset: pagination.offset,
                          },
                        }"
                        class="dropdown-item"
                        ><i
                          data-bs-toggle="dropdown"
                          class="fas fa-eye px-2"
                        ></i>
                        More</router-link
                      >
                    </li>

                    <li v-if="userType == 'Teacher'">
                      <button
                        @click="
                          remindUser({
                            userType: 'Student',
                            classID: row.id,
                            userID: row.studentID,
                          })
                        "
                        class="dropdown-item"
                      >
                        <i class="fas fa fa-bell px-2" aria-hidden="true"></i>

                        Remind student
                      </button>
                    </li>
                    <li>
                      <button
                        @click="
                          cancelClass({
                            classID: row.id,
                            studentID: row.studentID,
                            teacherID: row.teacherID,
                            startingDate: row.startingDate,
                          })
                        "
                        class="dropdown-item"
                      >
                        <i
                          data-bs-toggle="dropdown"
                          class="fas fa-times px-2"
                        ></i>
                        Cancel
                      </button>
                    </li>

                    <li>
                      <router-link
                        :to="{
                          name: 'ClientClassInfo',
                          params: {
                            id: row.id,
                            reschedule: true,
                            tap: false,
                            page: pagination.page,
                            offset: pagination.offset,
                          },
                        }"
                        class="dropdown-item"
                      >
                        <i
                          class="fas fa fa-calendar px-2"
                          aria-hidden="true"
                        ></i>
                        Reschedule
                      </router-link>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Pagination -->

    <vue-awesome-paginate
      :current-page="pagination.page"
      :total-items="pageCount"
      :items-per-page="offsetNum"
      :max-pages-shown="5"
      :on-click="onClickHandler"
    />
  </div>
</template>
<script>
import axios from "axios";
import moment from "moment-timezone";
// import RescheduleReq from "@/components/clients/sections/classes/RescheduleReq";
export default {
  props: ["offsetNum", "userType", "params"],
  // components: { RescheduleReq },
  data() {
    return {
      data: [],
      alerts: {
        success: null,
        error: null,
      },
      pageCount: 0,
      pagination: {
        page: 1,
        offset: 0,
      },
      search: "",
      userDateTime: moment().format("YYYY-MM-DD HH:mm"),
      classID: null,
    };
  },
  methods: {
    moment(date) {
      return moment(date);
    },
    pagiTransitions(sense) {
      if (sense == "back") {
        if (this.pagination.offset > 0) {
          this.pagination.offset = this.pagination.offset - this.offsetNum;
          this.pagination.page--;
        }
      } else if (sense == "next") {
        this.pagination.offset = this.pagination.offset + this.offsetNum;
        this.pagination.page++;
      }
      this.getData();
    },
    getData() {
      let queryReq = {
        params: {
          date: this.userDateTime,
          type: "",
          search: this.search,
          offset: this.pagination.offset,
        },
      };
      let url =
        this.userType == "Teacher"
          ? "http://localhost:3300/api/v1/teacher/classes/path0"
          : "http://localhost:3300/api/v1/guardian/classes/path0";
      axios
        .get(url, queryReq)
        .then((res) => {
          if (!res.data.success) {
            this.data = [];
            return (this.alerts.error = res.data.msg);
          }
          this.alerts.error = null;
          this.data = res.data.rows;
          this.pageCount = this.data[0].fullCount;
        })
        .catch(() => {
          console.log("Current/Error catched");
        });
    },
    remindUser(data) {
      this.alerts.error = null;
      this.alerts.success = null;

      let url = `http://localhost:3300/api/v1/admin/classes/path9`;
      axios
        .post(url, data)
        .then((res) => {
          window.scrollTo(
            0,
            document.body.scrollHeight || document.documentElement.scrollHeight
          );
          if (!res.data.success) {
            return (this.alerts.error = res.data.msg);
          }
          this.alerts.success = res.data.msg;
        })
        .catch(() => {
          console.log("Error catched");
        });
    },
    deleteData(id) {
      this.alerts.error = null;
      this.alerts.success = null;
      if (window.confirm("Are you sure you want to cancel this Class?")) {
        axios
          .delete(`http://localhost:3300/api/v1/admin/classes/path6/${id}`)
          .then((res) => {
            if (!res.data.success) {
              return (this.alerts.error = res.data.msg);
            }

            this.alerts.success = res.data.msg;
            this.$router.push("/");
          });
      }
    },
    cancelClass(data) {
      console.log(data);
      if (window.confirm("Are you sure you want to cancel this Class?")) {
        this.alerts.error = "";
        this.alerts.success = "";
        this.loadingBtn = true;

        //   // let data = {
        //   //   classID: this.classID,
        //   //   studentID: this.data[0].studentID,
        //   //   teacherID: this.data[0].teacherID,
        //   //   startingDate: this.data[0].startingDate,
        //   // };

        let url = `http://localhost:3300/api/v1/admin/classes/path7`;
        axios
          .post(url, data)
          .then((res) => {
            if (!res.data.success) {
              this.loadingBtn = false;
              return (this.alerts.error = res.data.msg);
            }
            this.alerts.success = res.data.msg;
            this.getData();
            this.loadingBtn = false;
          })
          .catch(() => {
            console.log("Error catched");
            this.loadingBtn = false;
          });
      }
    },
    onClickHandler(page) {
      this.pagination.offset = (page - 1) * this.offsetNum;
      this.pagination.page = page;
      this.getData();
    },
    // rescheduleClass(id) {
    //   this.$router.push(`/classes/${id}`);

    // },
  },
  created() {
    if (this.params.tap) {
      this.pagination.page = this.params.page;
      this.pagination.offset = this.params.offset;
    }

    this.getData();
  },
};
</script>
<style>
.nextClasses {
  background-color: #fff1dc;
  color: #181818;
  border-radius: 50px;
}
</style>
