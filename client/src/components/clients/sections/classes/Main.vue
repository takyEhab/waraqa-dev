<template>
  <div>
    <!-- Section Header -->
    <div class="d-flex justify-content-between">
      <div>
        <h3 class="section-title">Classes</h3>
        <p class="f-color-3_3">Here you can review your classes.</p>
      </div>
    </div>
    <!-- Section Tabs-->
    <div class="mt-5 col-12 col-md">
      <ul class="list-unstyled m-0 d-flex f-color-3_3">
        <li
          :class="[!previousTab ? 'f-color-1' : '', 'text-on-hover']"
          @click="previousTab = false"
        >
          New
          <hr v-if="!previousTab" class="tab-hr mt-1" />
        </li>
        <li
          :class="[previousTab ? 'f-color-1' : '', 'ms-5 text-on-hover']"
          @click="previousTab = true"
        >
          Old
          <hr v-if="previousTab" class="tab-hr mt-1" />
        </li>
      </ul>
    </div>
    <Previous
      v-if="previousTab"
      :userType="userType"
      :offsetNum="offsetNum"
      :params="$route.params"
    />
    <Current
      v-else
      :userType="userType"
      :offsetNum="offsetNum"
      :params="$route.params"
    />
  </div>
</template>

<script>
import Previous from "@/components/clients/sections/classes/Previous";
import Current from "@/components/clients/sections/classes/Current";
export default {
  props: ["offsetNum", "userType"],
  components: {
    Previous,
    Current,
  },
  data() {
    return {
      loadingBtn: false,
      alerts: {
        success: null,
        error: null,
      },
      previousTab: false,
    };
  },
  created() {
    if (this.$route.params.tap) {
      this.previousTab = JSON.parse(this.$route.params.tap);
    }
    this.$watch("previousTab", () => {
      this.$route.params = {};
    });
  },
};
</script>
