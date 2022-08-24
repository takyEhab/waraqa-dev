<template>
  <div
    class="modal fade"
    id="addClassModal"
    tabindex="-1"
    aria-labelledby="exampleModalLabel"
    aria-hidden="true"
  >
    <div class="modal-dialog">
      <div class="modal-content text-start">
        <header
          class="b-color-2 f-color-0 py-3 px-4 d-flex justify-content-between"
        >
          <h5 class="m-0">Create new Class</h5>
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
          <form class="mt-1" @submit.prevent="addClass">
            <!-- Subject & Teacher -->
            <div class="row flex-wrap">
              <!-- Subject -->
              <div class="col-12 col-md">
                <select class="form-select" v-model="subject" required>
                  <option value="">Subject</option>
                  <option v-for="subject in subjectsList" :key="subject.id">
                    {{ subject }}
                  </option>
                </select>
              </div>
              <!-- Teacher -->
              <div class="col-12 col-md">
                <v-select
                  placeholder="Teacher"
                  :options="teachers"
                  label="name"
                  :reduce="(teacher) => teacher.id"
                  v-model="teacherID"
                />
                <!-- <select class="form-select" v-model="teacherID" required>
                  <option value="">Teacher</option>
                  <option
                    v-for="teacher in teachers"
                    :key="teacher.id"
                    :value="teacher.id"
                  >
                    {{ teacher.name }}
                  </option>
                </select> -->
              </div>
            </div>
            <!-- Student & Class lin -->
            <div class="row flex-wrap">
              <!-- Student -->
              <div class="col-12 col-md mt-3">
                <v-select
                  placeholder="Student"
                  :options="students"
                  label="name"
                  :reduce="(student) => student.id"
                  v-model="studentID"
                />
              </div>

              <!-- Student -->
              <!-- <div class="col-12 col-md mt-3">
                <select
                  class="form-select"
                  v-model="studentID"
                  @change="getGuardian"
                  required
                >
                  <option value="">Student</option>
                  <option
                    v-for="student in students"
                    :key="student.id"
                    :value="student.id"
                  >
                    {{ student.name }}
                  </option>
                </select>
              </div> -->

              <!-- Class link -->
              <div class="col-12 col-md mt-3">
                <input
                  type="text"
                  class="form-control"
                  placeholder="Meeting Type"
                  v-model="classTitle"
                  required
                />
              </div>
            </div>
            <!-- Starting date & Duration -->
            <div class="row flex-wrap">
              <!-- Starting date -->
              <div class="col-12 col-md mt-3">
                <label class="f-color-3 mb-1">Start Date</label>
                <!-- <input
                  type="datetime-local"
                  class="form-control"
                  v-model="startingDate"
                  required
                /> -->

                <Datepicker
                  minutesIncrement="15"
                  minutesGridIncrement="15"
                  autoApply
                  v-model="startingDate"
                  placeholder="Type or choose a date"
                  textInput
                  showNowButton
                  required
                >
                  <template #am-pm-button="{ toggle, value }">
                    <button @click="toggle">{{ value }}</button>
                  </template>
                </Datepicker>
              </div>
              <!-- Class Duration -->
              <div class="col-12 col-md mt-3">
                <label class="f-color-3 mb-1">Duration</label>
                <select class="form-select" v-model="duration" required>
                  <option value="">Duration</option>
                  <option value="15">15 Mins</option>
                  <option value="30">30 Mins</option>
                  <option value="40">40 Mins</option>
                  <option value="45">45 Mins</option>
                  <option value="60">60 Mins (an hour)</option>
                  <option value="75">75 Mins (an hour and quarter)</option>
                  <option value="90">90 Mins (an hour and half)</option>
                  <option value="120">120Mins (two hours)</option>
                </select>
              </div>
            </div>
            <div style="display: flex; margin-top: 10px">
              <div
                class="btn btn-info mx-2"
                type="button"
                data-bs-toggle="modal"
                data-bs-target="#RepeatingDaysModal"
              >
                Repeating Days
              </div>
              <!-- Repeat days -->
              <!-- Days List -->
              <!-- <ul class="list-unstyled m-0 days-list d-flex">
                <li
                  v-for="day in days"
                  :key="day.id"
                  class="me-2"
                  :data-day="day"
                  @click="selectDays"
                >
                  {{ day }}
                </li>
              </ul> -->
              <!-- <input
                  type="time"
                  class="form-control"
                  placeholder="Enter Sunday"
                  v-model="daysTime.Mon"
                /> -->
            </div>

            <!-- Invite guests & Description -->
            <div class="row flex-wrap">
              <!-- Invite guests -->
              <div class="col-12 col-md mt-3">
                <label class="f-color-3 mb-1">Invite Guests</label>
                <input
                  type="text"
                  class="form-control"
                  placeholder="Enter Guests' Email"
                  v-model="guests"
                />
              </div>
              <!-- Class Description -->
              <div class="col-12 col-md mt-3">
                <textarea
                  type="text"
                  class="form-control"
                  placeholder="Class Information"
                  v-model="description"
                ></textarea>
              </div>
            </div>
            <div class="row flex-wrap">
              <div
                v-if="
                  Object.values(selectedDays).filter((item) => item != '')
                    .length >= 1
                "
                class="col-12 col-md mt-3"
              >
                <label class="f-color-3 mb-1">Payment Cycle</label>
                <input
                  type="number"
                  class="form-control"
                  placeholder="Months"
                  required
                  min="1"
                  v-model="payEvery"
                />
              </div>
              <!-- <div :class="[`col-${Object.values(selectedDays).filter((item) => item != '').length >= 1?'12':'6'}`, 'col-md', 'mt-5']"> -->

              <div class="col-12 col-md mt-5">
                <v-select
                  placeholder="TimeZone"
                  :options="TimeZoneList"
                  v-model="timeZone"
                />
              </div>
            </div>
            <!-- Count for -->
            <div class="col-12 col-md-6 mt-3">
              <label class="f-color-3 mb-1">Count for</label>
              <div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="flexCheckDefault"
                    v-model="countForTeacher"
                    :checked="countForTeacher"
                  />
                  <label class="form-check-label" for="flexCheckDefault">
                    Teacher
                  </label>
                </div>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="checkbox"
                    value=""
                    id="flexCheckChecked"
                    v-model="countForStudent"
                    :checked="countForStudent"
                  />
                  <label class="form-check-label" for="flexCheckChecked">
                    Student
                  </label>
                </div>
              </div>
            </div>
            <!-- Submit -->
            <div class="mt-4 text-end">
              <button
                :disabled="loadingBtn"
                type="submit"
                class="main-button-style with-100px f-color-0 border-0 py-2 px-3 rounded"
              >
                <div>
                  <span
                    v-if="loadingBtn"
                    class="spinner-grow spinner-grow-sm mx-2"
                    role="status"
                    aria-hidden="true"
                  ></span>
                  <span v-else>Create</span>
                </div>
              </button>
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
          </form>
        </div>
      </div>
    </div>
  </div>
  <RepeatingDays
    :day="test"
    :selectedDays="selectedDays"
    v-on:selectDay="updateSelectDay($event)"
    v-on:datePicker="updateDayTime($event)"
  />
</template>
<script>
import moment from "moment-timezone";
import axios from "axios";
import vSelect from "vue-select";
import "vue-select/dist/vue-select.css";
import Datepicker from "@vuepic/vue-datepicker";
import "@vuepic/vue-datepicker/dist/main.css";
import RepeatingDays from "@/components/admin/sections/classes/RepeatingDays";
import Tz from "@/components/Tz.json";

export default {
  components: {
    vSelect,
    Datepicker,
    RepeatingDays,
  },
  data() {
    return {
      payEvery: "",
      loadingBtn: false,
      alerts: {
        success: null,
        error: null,
      },
      subjectsList: [
        "Foundation level",
        "Pre-reading level",
        "Tajweed basics",
        "Intermediate",
        "Qari program",
        "Khatmah program",
        "Short surahs",
        "One Juz Surah",
        "Hafez program",
        "Ljazah program",
        "Basic arabic",
        "Intermediate arabic",
        "Upper-intermediate arabic",
        "Advanced arabic",
        "Classical arabic",
        "Indiputable facts of religion",
        "Intro to classical books",
      ],
      teachers: [],
      students: [],
      // guardianID: "",

      teacherID: null,
      studentID: null,
      subject: "",
      classTitle: "",
      startingDate: "",
      duration: "",
      guests: "",
      description: "",
      countForTeacher: true,
      countForStudent: true,
      timeZone: moment.tz.guess(),
      TimeZoneList: Tz,

      daysTime: {
        Sun: "",
        Mon: "",
        Tue: "",
        Wed: "",
        Thu: "",
        Fri: "",
        Sat: "",
      },

      selectedDays: {
        Sun: "",
        Mon: "",
        Tue: "",
        Wed: "",
        Thu: "",
        Fri: "",
        Sat: "",
      },
    };
  },
  methods: {
    moment(date) {
      return moment(date);
    },
    // updateDayTime(event) {
    //   console.log(event);
    // },
    updateSelectDay(data) {
      this.daysTime = data.daysTime;
      const { event } = data;
      let day = event.target.getAttribute("data-day");
      if (!this.selectedDays[day]) {
        // Fill Day
        this.selectedDays[day] = day;
      } else {
        //Empty Day & time
        this.selectedDays[day] = "";
        // this.daysTime[day] = "";
      }
      event.target.classList.toggle("selected-day");
    },
    // selectDays(event) {
    //   let day = event.target.getAttribute("data-day");
    //   if (!this.selectedDays[day]) {
    //     // Fill Day
    //     this.selectedDays[day] = day;
    //   } else {
    //     //Empty Day & time
    //     this.selectedDays[day] = "";
    //     this.daysTime[day] = "";
    //   }
    //   event.target.classList.toggle("selected-day");
    //   console.log(this.selectDays);
    // },
    // getGuardian() {
    //   let guardianID = this.students.find(
    //     (elm) => elm.id == this.studentID
    //   ).guardianID;
    //   this.guardianID = guardianID;
    // },
    addClass() {
      this.alerts.error = "";
      this.alerts.success = "";
      this.loadingBtn = true;
      console.log(this.daysTime);
      console.log(this.selectedDays);
      if (!this.studentID) {
        this.loadingBtn = false;

        return (this.alerts.error = "You have to choose a student.");
      }

      if (!this.teacherID) {
        this.loadingBtn = false;

        return (this.alerts.error = "You have to choose a teacher.");
      }
      // this.guardianID = this.students.find(
      //   (elm) => elm.id == this.studentID
      // ).guardianID;

      if (moment(this.startingDate).isBefore(moment())) {
        this.loadingBtn = false;
        return (this.alerts.error =
          "The starting date-time has passed. Please select the valid date-time.");
      }

      let classes = [];

      this.daysTime.Sun = `${this.daysTime.Sun.hours}:${this.daysTime.Sun.minutes}`;
      this.daysTime.Mon = `${this.daysTime.Mon.hours}:${this.daysTime.Mon.minutes}`;
      this.daysTime.Tue = `${this.daysTime.Tue.hours}:${this.daysTime.Tue.minutes}`;
      this.daysTime.Wed = `${this.daysTime.Wed.hours}:${this.daysTime.Wed.minutes}`;
      this.daysTime.Thu = `${this.daysTime.Thu.hours}:${this.daysTime.Thu.minutes}`;
      this.daysTime.Fri = `${this.daysTime.Fri.hours}:${this.daysTime.Fri.minutes}`;
      this.daysTime.Sat = `${this.daysTime.Sat.hours}:${this.daysTime.Sat.minutes}`;
      console.log(this.daysTime);
      let weeklyDaysTimes = {
        Sun: moment(this.daysTime.Sun, "HH:mm"),
        Mon: moment(this.daysTime.Mon, "HH:mm"),
        Tue: moment(this.daysTime.Tue, "HH:mm"),
        Wed: moment(this.daysTime.Wed, "HH:mm"),
        Thu: moment(this.daysTime.Thu, "HH:mm"),
        Fri: moment(this.daysTime.Fri, "HH:mm"),
        Sat: moment(this.daysTime.Sat, "HH:mm"),
      };
      console.log(weeklyDaysTimes);
      // 1- Class of this field => Starting Date
      let directClass = {
        weeklyDaysTimes: weeklyDaysTimes,
        guardianID: this.students.find((elm) => elm.id == this.studentID)
          .guardianID,
        teacherID: this.teacherID,
        studentID: this.studentID,
        subject: this.subject,
        classTitle: this.classTitle,
        startingDate: moment(this.startingDate, "YYYY-MM-DD HH:mm"),
        duration: this.duration,
        guests: this.guests,
        description: this.description,
        timeZone: this.timeZone,
        countForTeacher: this.countForTeacher ? 1 : 0,
        countForStudent: this.countForStudent ? 1 : 0,
      };
      // Push it with classes
      classes.push(directClass);

      // 2- Weekly Classes Start
      let start = moment(this.startingDate).format("YYYY-MM-DD");
      let end = moment(this.startingDate).add(this.payEvery, "M");
      // end = moment(moment(end).format('YYYY-MM-DD') + " 23:59:59") //NEW

      //Convert times to array
      let timesOfDays = Object.values(this.daysTime);
      timesOfDays = timesOfDays.filter(
        (item) => item !== "undefined:undefined"
      );

      //Convert days to array
      let selectedDaysArray = Object.values(this.selectedDays);
      selectedDaysArray = selectedDaysArray.filter((item) => item !== "");

      for (let i = 0; i < selectedDaysArray.length; i++) {
        // var day = moment(this.startingDate).day(selectedDaysArray[i]);
        var day = moment(start + " " + timesOfDays[i]).day(
          selectedDaysArray[i]
        );
        if (moment(day).isBefore(this.startingDate)) day.add(7, "d");

        while (day.isBefore(end)) {
          let weeklyClass = {
            teacherID: this.teacherID,
            studentID: this.studentID,
            subject: this.subject,
            classTitle: this.classTitle,
            startingDate: day.format("YYYY-MM-DD HH:mm").toString(),
            duration: this.duration,
            guests: this.guests,
            description: this.description,
            timeZone: this.timeZone,
            countForTeacher: this.countForTeacher ? 1 : 0,
            countForStudent: this.countForStudent ? 1 : 0,
          };
          classes.push(weeklyClass);
          // console.log(day.format("YYYY-MM-DD").toString())
          // console.log(day.toString())
          day.add(7, "d");
        }
      }
      let url = "http://localhost:3300/api/v1/admin/classes/path0";
      axios
        // .post(url, { payEvery: this.payEvery })
        .post(url, { classes, payEvery: this.payEvery })
        .then((res) => {
          if (!res.data.success) {
            this.loadingBtn = false;
            return (this.alerts.error = res.data.msg);
          }
          this.alerts.success = res.data.msg;
          this.teacherID = null;
          this.studentID = null;
          this.loadingBtn = false;
        })
        .catch(() => {
          console.log("Error catched");
          this.loadingBtn = false;
        });
    },
    fetchTeachers() {
      //Uses in AddEvaluation modal
      let url = "http://localhost:3300/api/v1/admin/teachers/path0";
      axios
        .get(url, { params: { status: 1 } })
        .then((res) => {
          this.teachers = res.data.rows;
        })
        .catch(() => {
          console.log("Error catched");
        });
    },
    fetchStudents() {
      let url = "http://localhost:3300/api/v1/admin/students/path0";
      axios
        .get(url, { params: { status: 1 } })
        .then((res) => {
          this.students = res.data.rows;
        })
        .catch(() => {
          console.log("Error catched");
        });
    },
  },
  created() {
    this.fetchTeachers();
    this.fetchStudents();
  },
};
</script>
<style scoped>
@media (min-width: 576px) {
  .modal-dialog {
    max-width: 40%;
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
