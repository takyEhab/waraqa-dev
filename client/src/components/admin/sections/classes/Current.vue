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
            placeholder="Search"
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
        <div v-for="row in data" :key="row.id" class="table-row py-3">
          <div class="px-2 d-flex f-color-3">
            <span class="col-3" style="font-family: Merienda">
              <span style="margin-left: 35px; font-weight: 900; color: #4c4a4c">
                {{ moment(row.startingDate).format("hh:mm A") }}
              </span>
              <br />
              {{ moment(row.startingDate).format("ddd, MMM D, YYYY") }}
            </span>

            <span class="col-2">{{ row.studentName }}</span>
            <span class="col-2">{{ row.teacherName }}</span>
            <span class="col-2">{{ row.subject }}</span>

            <span class="col-2">{{ row.duration }} m</span>

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
                        name: 'ClassInfo',
                        params: {
                          id: row.id,
                          tap: false,
                          page: pagination.page,
                          offset: pagination.offset,
                        },
                      }"
                      class="dropdown-item"
                      ><i data-bs-toggle="dropdown" class="fas fa-eye px-2"></i>
                      More</router-link
                    >
                  </li>

                  <li>
                    <button @click="deleteData(row.id)" class="dropdown-item">
                      <i
                        data-bs-toggle="dropdown"
                        class="fas fa-trash px-2"
                      ></i>
                      Delete
                    </button>
                  </li>

                  <li>
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
                        remindUser({
                          userType: 'Teacher',
                          classID: row.id,
                          userID: row.teacherID,
                        })
                      "
                      class="dropdown-item"
                    >
                      <i class="fas fa fa-bell px-2" aria-hidden="true"></i>

                      Remind teacher
                    </button>
                  </li>
                </ul>
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
      </div>
    </div>
    <!-- Pagination -->
    <vue-awesome-paginate
      :total-items="pageCount"
      :items-per-page="offsetNum"
      :max-pages-shown="5"
      :on-click="onClickHandler"
      :current-page="pagination.page"
    />
  </div>
</template>
<script>
import axios from "axios";
import moment from "moment-timezone";
export default {
  props: ["offsetNum", "params"],
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
      let url = "http://localhost:3300/api/v1/admin/classes/path1";
      axios
        .get(url, queryReq)
        .then((res) => {
          if (!res.data.success) {
            this.data = [];
            console.log(res.data);
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
    deleteData(id) {
      this.alerts.error = null;
      this.alerts.success = null;
      if (window.confirm("Are you sure you want to delete this Class?")) {
        axios
          .delete(`http://localhost:3300/api/v1/admin/classes/path6/${id}`)
          .then((res) => {
            if (!res.data.success) {
              return (this.alerts.error = res.data.msg);
            }

            this.alerts.success = res.data.msg;
            this.$router.push("/admin");
          });
      }
    },
    remindUser(data) {
      this.alerts.error = null;
      this.alerts.success = null;

      let url = `http://localhost:3300/api/v1/admin/classes/path9`;
      axios
        .post(url, data)
        .then((res) => {
          if (!res.data.success) {
            return (this.alerts.error = res.data.msg);
          }
          this.alerts.success = res.data.msg;
          window.scrollTo(
            0,
            document.body.scrollHeight || document.documentElement.scrollHeight
          );
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
    this.getData();
  },
};
</script>
