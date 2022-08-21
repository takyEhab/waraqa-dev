<template>
  <div>
    <!-- Section Header -->
    <div class="d-flex justify-content-between">
      <h3 class="section-title">Billing</h3>
      <div
        class="f-color-1 text-on-hover"
        type="button"
        data-bs-toggle="modal"
        data-bs-target="#CreateInvoiceModal"
      >
        <i class="fas fa-plus"></i> Create manual Invoice
      </div>
      <CreateInvoice />
    </div>

    <div></div>
    <!-- Section Tabs-->
    <div class="mt-5 col-12 col-md">
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
    <Guardians v-if="firstTab" :offsetNum="offsetNum" :params="$route.params" />
    <Teachers v-else :offsetNum="offsetNum" :params="$route.params" />
  </div>
</template>

<script>
import Guardians from "@/components/admin/sections/bills/guardians/Guardians";
import Teachers from "@/components/admin/sections/bills/teachers/Teachers";
import CreateInvoice from "@/components/admin/sections/bills/CreateInvoice";

export default {
  props: ["offsetNum"],
  components: {
    Guardians,
    Teachers,
    CreateInvoice,
  },
  data() {
    return {
      loadingBtn: false,
      alerts: {
        success: null,
        error: null,
      },
      firstTab: true,
    };
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
