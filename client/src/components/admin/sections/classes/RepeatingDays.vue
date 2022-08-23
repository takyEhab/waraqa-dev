<template>
  <div
    class="modal fade"
    id="RepeatingDaysModal"
    tabindex="-1"
    aria-labelledby="exampleModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog">
      <div class="modal-content text-start">
        <header
          class="b-color-1 f-color-0 py-3 px-4 d-flex justify-content-between"
        >
          <h5 class="m-0">Repeating Days</h5>
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
          <form @submit.prevent="submitForm">
            <div class="col-12 col-md-9 mt-3">
              <ul class="list-unstyled m-0 days-list d-flex">
                <li
                  v-for="day in days"
                  :key="day.id"
                  class="me-2"
                  :data-day="day"
                  @click="selectDays"
                >
                  {{ day }}
                </li>
              </ul>
            </div>
            <div class="row flex-wrap align-items-center">
              <!-- Sunday input -->
              <div class="col-12 col-md-6 mt-3">
                <label class="f-color-3 mb-1">Sunday</label>

                <Datepicker
                autoApply
                  minutesGridIncrement="15"
                  minutesIncrement="15"
                  placeholder="Choose time"
                  v-model="daysTime.Sun"
                  :disabled="selectedDays.Sun ? disabled : ''"
                  timePicker
                  required
                  textInput
                  utc
                />
              </div>
              <!-- monday input -->
              <div class="col-12 col-md-6 mt-3">
                <label class="f-color-3 mb-1">Monday</label>
                <Datepicker
                autoApply
                  minutesGridIncrement="15"
                  minutesIncrement="15"
                  placeholder="Choose time"
                  v-model="daysTime.Mon"
                  :disabled="selectedDays.Mon ? disabled : ''"
                  timePicker
                  required
                  textInput
                  utc
                />
              </div>
              <!-- tuesday input -->
              <div class="col-12 col-md-6 mt-3">
                <label class="f-color-3 mb-1">Tuesday</label>
                <Datepicker
                autoApply
                  minutesGridIncrement="15"
                  minutesIncrement="15"
                  placeholder="Choose time"
                  v-model="daysTime.Tue"
                  :disabled="selectedDays.Tue ? disabled : ''"
                  timePicker
                  required
                  textInput
                  utc
                />
              </div>
              <!-- wednesday input -->
              <div class="col-12 col-md-6 mt-3">
                <label class="f-color-3 mb-1">Wednesday</label>
                <Datepicker
                autoApply
                  minutesGridIncrement="15"
                  minutesIncrement="15"
                  placeholder="Choose time"
                  v-model="daysTime.Wed"
                  :disabled="selectedDays.Wed ? disabled : ''"
                  timePicker
                  required
                  textInput
                  utc
                />
              </div>
              <!-- thursday input -->
              <div class="col-12 col-md-6 mt-3">
                <label class="f-color-3 mb-1">Thursday</label>


                <Datepicker
                autoApply
                  minutesGridIncrement="15"
                  minutesIncrement="15"
                  placeholder="Choose time"
                  v-model="daysTime.Thu"
                  :disabled="selectedDays.Thu ? disabled : ''"
                  timePicker
                  required
                  textInput
                  utc
                />
              </div>
              <!-- friday input -->
              <div class="col-12 col-md-6 mt-3">
                <label class="f-color-3 mb-1">Friday</label>
                <Datepicker
                autoApply
                  minutesGridIncrement="15"
                  minutesIncrement="15"
                  placeholder="Choose time"
                  v-model="daysTime.Fri"
                  :disabled="selectedDays.Fri ? disabled : ''"
                  timePicker
                  required
                  textInput
                  utc
                />
              </div>
              <!-- saturday input -->
              <div class="col-12 col-md-6 mt-3">
                <label class="f-color-3 mb-1">Saturday</label>

                <Datepicker
                autoApply
                  minutesGridIncrement="15"
                  minutesIncrement="15"
                  placeholder="Choose time"
                  v-model="daysTime.Sat"
                  :disabled="selectedDays.Sat ? disabled : ''"
                  timePicker
                  required
                  textInput
                  utc
                />
              </div>
            </div>
            <!-- Submit -->
            <div class="mt-4 text-end">
              <button
                type="submit"
                class="main-button-style with-100px f-color-0 border-0 py-2 px-3 rounded"
              >
                Done
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import moment from "moment-timezone";
import "@vuepic/vue-datepicker/dist/main.css";
import Datepicker from "@vuepic/vue-datepicker";

export default {
  props: ["selectedDays"],
  components: {
    Datepicker,
  },
  data() {
    return {
      loadingBtn: false,
      alerts: {
        success: null,
        error: null,
      },
      days: {
        Sun: "Sun",
        Mon: "Mon",
        Tue: "Tue",
        Wed: "Wed",
        Thu: "Thu",
        Fri: "Fri",
        Sat: "Sat",
      },
      daysTime: {
        Sun: "",
        Mon: "",
        Tue: "",
        Wed: "",
        Thu: "",
        Fri: "",
        Sat: "",
      },
      // selectedDays: {
      //   Sun: "",
      //   Mon: "",
      //   Tue: "",
      //   Wed: "",
      //   Thu: "",
      //   Fri: "",
      //   Sat: "",
      // },
    };
  },
  methods: {
    moment(date) {
      return moment(date);
    },
    selectDays(event) {
      this.$emit("selectDay", { event, daysTime: this.daysTime });
      // let day = event.target.getAttribute("data-day");
      // if (!this.selectedDays[day]) {
      //   // Fill Day
      //   this.selectedDays[day] = day;

      // } else {
      //   //Empty Day & time
      //   this.selectedDays[day] = "";
      //   this.daysTime[day] = "";
      // }
      // event.target.classList.toggle("selected-day");
    },
    submitForm() {
      let btn = document.createElement("button");
      btn.setAttribute("data-bs-toggle", "modal");
      btn.setAttribute("data-bs-target", "#addClassModal");

      document.body.appendChild(btn);
      setTimeout(() => {
        btn.click();
      }, 500);
    },
  },
  // created() {
  // console.log(this.day);
  // this.day = 'other testing text'
  // },
};
</script>
<style scoped>
@media (min-width: 900px) {
  .modal-dialog {
    max-width: 45%;
  }
}
.days-list li {
  background-color: var(--color-4_1);
  color: var(--color-4);
  border-radius: 50%;
  width: 35px;
  text-align: center;
  height: 35px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 80%;
  cursor: pointer;
}

.days-list li:hover {
  background-color: var(--color-4);
  color: var(--color-0);
  transition: 0.2s ease-in-out;
}
.selected-day {
  background-color: var(--color-4) !important;
  color: var(--color-0) !important;
}
</style>
