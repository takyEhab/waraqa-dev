<template>
  <div>
    <!-- Section Header -->
    <div>
      <h3 class="section-title">Teachers</h3>
    </div>
    <!-- Filters & Search -->
    <div class="mt-4 d-flex justify-content-md-between flex-wrap">
      <!-- Filters -->
      <div class="section-filters">
        <ul class="list-unstyled m-0 d-flex f-color-1">
          <li
            :class="[filters.one ? 'opacity-100' : '', 'px-2']"
            @click="
              (pageCount = 0),
                (pagination.offset = 0),
                (pagination.page = 1),
                (filters.one = !filters.one),
                (filters.two = false),
                (filters.three = false);
              getData();
            "
          >
            <small>Active</small>
          </li>
          <li
            :class="[filters.two ? 'opacity-100' : '', 'ms-2 ms-md-3 px-2']"
            @click="
              (pageCount = 0),
                (pagination.offset = 0),
                (pagination.page = 1),
                (filters.one = false),
                (filters.two = !filters.two),
                (filters.three = false);
              getData();
            "
          >
            <small>Inactive</small>
          </li>
          <li
            :class="[filters.three ? 'opacity-100' : '', 'ms-2 ms-md-3 px-2']"
            @click="
              (pageCount = 0),
                (pagination.offset = 0),
                (pagination.page = 1),
                (filters.one = false),
                (filters.two = false),
                (filters.three = !filters.three);
              getData();
            "
          >
            <small>Vacation</small>
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
    <div
      v-if="Paywages"
      @click="sendPaywages"
      class="f-color-4 opacity-75 opacity-100-on-hover text-decoration-underline"
    >
      Pay wages? {{ sentPaywages ? " (Sent)" : " (Not sent yet!)" }}
    </div>

    <!-- Table -->
    <div
      class="mt-4 b-color-0 box-shadow-style px-md-2 py-3"
      style="overflow: hidden; overflow-x: auto"
    >
      <div style="min-width: 62em">
        <div class="px-2 table-colums f-color-3_3 d-flex mb-4">
          <small class="col-2"> </small>
          <small class="col-3">Full Name</small>
          <small class="col-1">Students</small>
          <small class="col-1">Hours</small>
          <small class="col-2">Zoom Link</small>
          <small class="col-2">Status</small>
          <small class="col-1">More</small>
        </div>
        <div v-for="row in data" :key="row.id" class="table-row py-3">
          <div class="px-2 d-flex f-color-3">
            <span class="col-2">
              <img
                v-if="row.picture"
                :src="row.picture"
                class="avatar-img rounded-circle"
                alt="teacher picture"
              />
              <span v-else class="avatar">{{
                row.name.charAt(0).toUpperCase()
              }}</span>
            </span>
            <span class="col-3">{{ row.name }}</span>
            <span class="col-1">{{
              row.studentsCount ? row.studentsCount : 0
            }}</span>
            <span :class="[row.hours < 1 ? 'f-color-4' : '', 'col-1']">{{
              row.hours ? (row.hours / 60).toFixed(2) : 0
            }}</span>
            <span class="col-2"
              ><a :href="row.classLink" target="_blank"
                ><i class="fas fa-play f-color-1"></i
              ></a>
              <i
                @click="copyClassLink(row.classLink)"
                style="margin-left: 20px"
                class="fas f-color-1 fa-copy"
              ></i>
            </span>

            <span
              :class="[row.status == 1 ? 'f-color-1' : 'f-color-4', 'col-2']"
            >
              {{
                row.status == 1
                  ? "Active"
                  : row.status == 2
                  ? "Inactive"
                  : "Vacation"
              }}
            </span>
            <div class="col-1">
              <router-link
                :to="{
                  name: 'TeacherInfo',
                  params: {
                    id: row.id,
                    page: pagination.page,
                    offset: pagination.offset,
                    filter: Object.keys(filters).find(
                      (key) => filters[key] == true
                    ),
                  },
                }"
                class="f-color-1"
                ><i class="fas fa-eye"></i
              ></router-link>
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
  props: ["offsetNum"],
  components: {},
  data() {
    return {
      data: [],
      loadingBtn: false,
      alerts: {
        success: null,
        error: null,
      },
      filters: {
        one: true,
        two: false,
        three: false,
      },
      Paywages: false, // Will be true on the first day of each month
      sentPaywages: false, // Will be True after successfull sent
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
    copyClassLink(classLink) {
      navigator.clipboard.writeText(classLink);
    },
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
    sendPaywages() {
      let url = "http://localhost:3300/api/v1/admin/bills/path10";
      axios
        .get(url)
        .then((res) => {
          if (!res.data.success) {
            return (this.alerts.error = res.data.msg);
          }
          this.alerts.error = null;
          this.sentPaywages = true;
        })
        .catch(() => {
          console.log("Sent Paywages/Error catched");
        });
    },
    getData() {
      let status;
      if (this.filters.one) {
        status = 1;
      } else if (this.filters.two) {
        status = 2;
      } else if (this.filters.three) {
        status = 3;
      }
      let queryReq = {
        params: {
          search: this.search,
          status: status,
          offset: this.pagination.offset,
        },
      };
      let url = "http://localhost:3300/api/v1/admin/teachers/path0";
      axios
        .get(url, queryReq)
        .then((res) => {
          console.log(res.data.rows);
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
    onClickHandler(page) {
      this.pagination.offset = (page - 1) * this.offsetNum;
      this.pagination.page = page;
      this.getData();
    },
  },
  created() {
    const { params } = this.$route;
    if (params) {
      this.pagination.page = params.page;
      this.pagination.offset = params.offset;
    }
    if (params.filter) {
      this.filters[params.filter] = true;
    }

    this.getData();

    let today = moment().format("YYYY-MM-DD");
    let firstDayOfMonth = moment().startOf("month").format("YYYY-MM-DD");
    if (today == firstDayOfMonth) {
      this.Paywages = true;
    }
  },
};
</script>
