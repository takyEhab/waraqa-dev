<template>
  <div class="position-relative">
    <!-- Section Header -->
    <div class="d-flex justify-content-between flex-wrap">
      <h3 class="section-title">Billing</h3>

      <!-- Section Tabs-->
      <div class="col-md-5">
        <ul class="list-unstyled m-0 d-flex f-color-3_3">
          <li
            :class="[firstTab ? 'f-color-1' : '', 'text-on-hover']"
            @click="firstTab = true"
          >
            Guardians
            <hr v-if="firstTab" class="tab-hr mt-1" />
          </li>
          <li
            :class="[!firstTab ? 'f-color-1' : '', 'ms-5 text-on-hover']"
            @click="firstTab = false"
          >
            Teachers
            <hr v-if="!firstTab" class="tab-hr mt-1" />
          </li>
        </ul>
      </div>
      <!-- Search -->
      <div class="col-12 col-md-3">
        <div class="d-flex position-relative align-items-center">
          <input
            type="text"
            class="form-control"
            v-model="search"
            @keyup="searchFun()"
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

    <Guardians
      v-if="firstTab"
      ref="guardian"
      :offsetNum="offsetNum"
      :params="$route.params"
    />
    <Teachers
      v-else
      ref="teacher"
      :offsetNum="offsetNum"
      :params="$route.params"
    />
  </div>
</template>

<script>
import Guardians from "@/components/admin/sections/bills/guardians/Guardians";
import Teachers from "@/components/admin/sections/bills/teachers/Teachers";
// import CreateInvoice from "@/components/admin/sections/bills/CreateInvoice";

export default {
  props: ["offsetNum"],
  components: {
    Guardians,
    Teachers,
    // CreateInvoice,
  },
  data() {
    return {
      loadingBtn: false,
      alerts: {
        success: null,
        error: null,
      },
      firstTab: true,
      search: "",
    };
  },
  methods: {
    searchFun() {
      this.firstTab
        ? this.$refs.guardian.getData(this.search)
        : this.$refs.teacher.getData(this.search);
    },
  },
  created() {
    if (this.$route.params.tap) {
      this.firstTab = JSON.parse(this.$route.params.tap);
    }
    this.$watch("firstTab", () => {
      this.$route.params = {};
    });
  },
};
</script>
