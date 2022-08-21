<template>
  <div>
    <!-- Section Header -->
    <div class="d-flex justify-content-between">
      <div>
        <h3 class="section-title">Classes</h3>
      </div>
      <div>
        <div
          class="f-color-1 text-on-hover"
          type="button"
          data-bs-toggle="modal"
          data-bs-target="#addClassModal"
        >
          <i class="fas fa-plus"></i> Create Class
        </div>
        <div
          class="f-color-2 opacity-75 opacity-100-on-hover"
          type="button"
          data-bs-toggle="modal"
          data-bs-target="#RescheduleClassesModal"
        >
          <i class="fas fa-history"></i> Reschedule
        </div>


        <div
      
          class="f-color-4 text-on-hover"
          type="button"
          data-bs-toggle="modal"
          data-bs-target="#DeleteClassesModal"
        >
          <i class="fas fa-trash"></i> Delete Classes
        </div>

      </div>
      

      <AddClass />
      <Reschedule />
      <DeleteClasses />
    </div>
    <!-- Section Tabs-->
    <div class="mt-5 col-12 col-md">
      <ul class="list-unstyled m-0 d-flex f-color-3_3">
        <li
          :class="[!previousTab ? 'f-color-1' : '', ' text-on-hover']"
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
      :offsetNum="offsetNum"
      :params="$route.params"
    />
    <Current v-else :offsetNum="offsetNum" :params="$route.params" />
  </div>
</template>

<script>
import AddClass from "@/components/admin/sections/classes/AddClass";
import Reschedule from "@/components/admin/sections/classes/Reschedule";
import DeleteClasses from "@/components/admin/sections/classes/DeleteClasses";
import Previous from "@/components/admin/sections/classes/Previous";
import Current from "@/components/admin/sections/classes/Current";

export default {
  props: ["offsetNum"],
  components: {
    AddClass,
    Reschedule,
    Previous,
    Current,
    DeleteClasses
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
