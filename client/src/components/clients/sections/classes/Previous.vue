<template>
  <div>
    <!-- Filters & Search -->
    <div class="mt-4 d-flex justify-content-md-between flex-wrap">
      <!-- Filters -->
      <div class="section-filters">
        <ul class="list-unstyled m-0 d-flex f-color-1">
          <li
            :class="[filters.five ? 'opacity-100' : '', 'px-2']"
            @click="
              (pageCount = 0),
                (pagination.offset = 0),
                (pagination.page = 1),
                (filters.one = false),
                (filters.two = false),
                (filters.three = false),
                (filters.four = false),
                (filters.five = !filters.five);
              getData();
            "
          >
            <small>Old</small>
          </li>
          <li
            :class="[filters.one ? 'opacity-100' : '', 'ms-2 ms-md-3 px-2']"
            @click="
              (pageCount = 0),
                (pagination.offset = 0),
                (pagination.page = 1),
                (filters.one = !filters.one),
                (filters.two = false),
                (filters.three = false),
                (filters.four = false),
                (filters.five = false);
              getData();
            "
          >
            <small>Completed</small>
          </li>
          <li
            :class="[filters.two ? 'opacity-100' : '', 'ms-2 ms-md-3 px-2']"
            @click="
              (pageCount = 0),
                (pagination.offset = 0),
                (pagination.page = 1),
                (filters.one = false),
                (filters.two = !filters.two),
                (filters.three = false),
                (filters.four = false),
                (filters.five = false);
              getData();
            "
          >
            <small>Cancelled</small>
          </li>
          <li
            :class="[filters.three ? 'opacity-100' : '', 'ms-2 ms-md-3 px-2']"
            @click="
              (pageCount = 0),
                (pagination.offset = 0),
                (pagination.page = 1),
                (filters.one = false),
                (filters.two = false),
                (filters.three = !filters.three),
                (filters.four = false),
                (filters.five = false);
              getData();
            "
          >
            <small>Missed</small>
          </li>
        </ul>
      </div>
      <!-- Search -->
      <div class="mt-4 mt-md-0 col-12 col-md-4">
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
          <small class="col-2">Date</small>
          <small class="col-2">Student</small>
          <small class="col-2">Teacher</small>
          <small class="col-2">Subject</small>
          <small class="col-1">Status</small>
          <small class="col-1 mx-2">Performance</small>
          <small class="col-1">Duration</small>
          <small class="col-1">More</small>
        </div>
        <div v-for="row in data" :key="row.id" class="table-row py-3">
          <div class="px-2 d-flex f-color-3">
            <span class="col-2" style="font-family: Merienda">
              <span style="margin-left: 35px; font-weight: 900; color: #4c4a4c">
                {{ moment(row.startingDate).format("hh:mm A") }}
              </span>
              <br />
              {{ moment(row.startingDate).format("ddd, MMM D, YYYY") }}
            </span>

            <span class="col-2">{{ row.studentName }}</span>
            <span class="col-2">{{ row.teacherName }}</span>
            <span class="col-2">{{ row.subject }}</span>
            <span class="col-1 mx-2">{{
              row.status == 0
                ? "Active"
                : row.status == 1
                ? "Attended"
                : row.status == 2
                ? "Cancelled by student"
                : row.status == 3
                ? "Cancelled by teacher"
                : row.status == 4
                ? "Missed by student"
                : row.status == 5
                ? "Missed by teacher"
                : "Cancelled by admin"
            }}</span>
            <span class="col-1">{{
              row.status == 0
                ? "No Report"
                : `5/${row.classPerformance ? row.classPerformance : "0"}`
            }}</span>
            <span class="col-1">{{ row.duration }} m</span>

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
                          tap: true,
                          page: pagination.page,
                          offset: pagination.offset,
                          filter: Object.keys(filters).find(
                            (key) => filters[key] == true
                          ),
                        },
                      }"
                      class="dropdown-item"
                      ><i data-bs-toggle="dropdown" class="fas fa-eye px-2"></i>
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

                  <li
                    v-if="
                      !row.status &&
                      Math.abs(moment().diff(row.startingDate, 'hours')) < 48
                    "
                  >
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
                      <i class="fas fa fa-calendar px-2" aria-hidden="true"></i>
                      Reschedule
                    </router-link>
                  </li>
                  <li
                    v-if="
                      userType == 'Teacher' && !row.status && row.canReport == 1
                    "
                  >
                    <router-link
                      :to="{
                        name: 'ClientClassInfo',
                        params: {
                          id: row.id,
                          submitClassReport: true,
                          tap: true,
                          page: pagination.page,
                          offset: pagination.offset,
                          filter: Object.keys(filters).find(
                            (key) => filters[key] == true
                          ),
                        },
                      }"
                      class="dropdown-item"
                      ><i
                        class="fas fa fa-check-circle px-2"
                        aria-hidden="true"
                      ></i>
                      Submit</router-link
                    >
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Pagination -->

    <vue-awesome-paginate
      style="margin-top: 20px"
      :total-items="pageCount"
      :items-per-page="offsetNum"
      :max-pages-shown="5"
      :current-page="pagination.page"
      :on-click="onClickHandler"
    />
  </div>
</template>
<script>
import axios from "axios";
import moment from "moment-timezone";
export default {
  props: ["offsetNum", "userType", "params"],
  data() {
    return {
      data: [],
      alerts: {
        success: null,
        error: null,
      },
      filters: {
        one: false,
        two: false,
        three: false,
        four: false,
        five: false,
      },
      pageCount: 0,
      pagination: {
        page: 1,
        offset: 0,
      },
      search: "",
      userDateTime: moment().format("YYYY-MM-DD HH:mm"),
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
      let status;
      if (this.filters.one) {
        status = 1;
      } else if (this.filters.two) {
        status = 2;
      } else if (this.filters.three) {
        status = 3;
      } else if (this.filters.four) {
        status = 4;
      } else if (this.filters.five) {
        status = 0;
      }
      let queryReq = {
        params: {
          date: this.userDateTime,
          type: "previous",
          search: this.search,
          status: status,
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
          console.log("Previous/Error catched");
        });
    },
    remindUser(data) {
      this.alerts.error = null;
      this.alerts.success = null;

      let url = `http://localhost:3300/api/v1/admin/classes/path9`;
      axios
        .post(url, data)
        .then((res) => {
          // window.scrollTo(
          //   0,
          //   document.body.scrollHeight || document.documentElement.scrollHeight
          // );
          if (!res.data.success) {
            return (this.alerts.error = res.data.msg);
          }
          this.alerts.success = res.data.msg;
        })
        .catch(() => {
          console.log("Error catched");
        });
    },
    onClickHandler(page) {
      this.pagination.offset = (page - 1) * this.offsetNum;
      this.pagination.page = page;
      this.getData();
    },
  },
  created() {
    if (this.params.tap) {
      this.pagination.page = this.params.page;
      this.pagination.offset = this.params.offset;
    }
    if (this.params.filter) {
      console.log(this.params.filter);
      this.filters[this.params.filter] = true;
    }

    this.getData();
  },
};
</script>
