import { createRouter, createWebHistory } from "vue-router";
//Client Routes
import Index from "../views/client/Index.vue";

import ClientDashboard from "@/components/clients/sections/Dashboard.vue";
import ClientTeachers from "@/components/clients/sections/Teachers.vue";
import ClientStudents from "@/components/clients/sections/Students.vue";
import ClientClasses from "@/components/clients/sections/Classes.vue";
import ClientLibrary from "@/components/clients/sections/Library.vue";
import ClientBills from "@/components/clients/sections/Bills.vue";

import ClientTeacherMain from "@/components/clients/sections/teachers/Main.vue";
import ClientTeacherInfo from "@/components/clients/sections/teachers/Information.vue";

import ClientStudentMain from "@/components/clients/sections/students/Main.vue";
import ClientStudentInfo from "@/components/clients/sections/students/Information.vue";

import ClientClassMain from "@/components/clients/sections/classes/Main.vue";
import ClientClassInfo from "@/components/clients/sections/classes/Information.vue";

import ClientBillsMain from "@/components/clients/sections/bills/Main.vue";
import ClientTeacherInvoiceInfo from "@/components/clients/sections/bills/teachers/Information.vue";
import ClientGuardianInvoiceInfo from "@/components/clients/sections/bills/guardians/Information.vue";

//Admin Routes
import Admin from "@/views/admin/Index.vue";

import Dashboard from "@/components/admin/sections/Dashboard.vue";
import Teachers from "@/components/admin/sections/Teachers.vue";
import Guardians from "@/components/admin/sections/Guardians.vue";
import Students from "@/components/admin/sections/Students.vue";
import Classes from "@/components/admin/sections/Classes.vue";
import Library from "@/components/admin/sections/Library.vue";
import Bills from "@/components/admin/sections/Bills.vue";
import Expenses from "@/components/admin/sections/Expenses.vue";

import TeacherMain from "@/components/admin/sections/teachers/Main.vue";
import TeacherInfo from "@/components/admin/sections/teachers/Information.vue";

import GuardianMain from "@/components/admin/sections/guardians/Main.vue";
import GuardianInfo from "@/components/admin/sections/guardians/Information.vue";

import StudentMain from "@/components/admin/sections/students/Main.vue";
import StudentInfo from "@/components/admin/sections/students/Information.vue";
import WaitListEdit from "@/components/admin/sections/students/WaitListInformation.vue";

import ClassMain from "@/components/admin/sections/classes/Main.vue";
import ClassInfo from "@/components/admin/sections/classes/Information.vue";

import BillsMain from "@/components/admin/sections/bills/Main.vue";
import GuardianInvoiceInfo from "@/components/admin/sections/bills/guardians/Information.vue";
import TeacherInvoiceInfo from "@/components/admin/sections/bills/teachers/Information.vue";

const routes = [
  // Clients Routes
  {
    path: "/",
    name: "Index",
    component: Index,
    children: [
      {
        path: "/",
        component: ClientDashboard,
      },
      {
        path: "/teachers",
        component: ClientTeachers,
        children: [
          {
            path: "/teachers",
            component: ClientTeacherMain,
          },
          {
            path: "/teachers/:id",
            name: "ClientTeacherInfo",
            component: ClientTeacherInfo,
          },
        ],
      },
      {
        path: "/students",
        component: ClientStudents,
        children: [
          {
            path: "/students",
            component: ClientStudentMain,
          },
          {
            path: "/students/:id",
            name: "ClientStudentInfo",
            component: ClientStudentInfo,
          },
        ],
      },
      {
        path: "/classes",
        component: ClientClasses,
        children: [
          {
            path: "/classes",
            name: "ClientClassMain",
            component: ClientClassMain,
          },
          {
            path: "/classes/:id",
            name: "ClientClassInfo",
            component: ClientClassInfo,
          },
        ],
      },
      {
        path: "/library",
        component: ClientLibrary,
      },
      {
        path: "/bills",
        component: ClientBills,
        children: [
          {
            path: "/bills",
            component: ClientBillsMain,
          },
          {
            path: "/bills/guardian/:id",
            name: "ClientGuardianInvoiceInfo",
            component: ClientGuardianInvoiceInfo,
          },
          {
            path: "/bills/teacher/:id",
            name: "ClientTeacherInvoiceInfo",
            component: ClientTeacherInvoiceInfo,
          },
        ],
      },
    ],
  },

  // Dashboard routes
  {
    path: "/manage",
    name: "Admin",
    component: Admin,
    children: [
      {
        path: "/manage",
        component: Dashboard,
      },
      {
        path: "/manage/teachers",
        component: Teachers,
        children: [
          {
            path: "/manage/teachers",
            component: TeacherMain,
            name: "TeacherMain",
          },
          {
            path: "/manage/teachers/:id",
            name: "TeacherInfo",
            component: TeacherInfo,
          },
        ],
      },
      {
        path: "/manage/guardians",
        component: Guardians,
        children: [
          {
            path: "/manage/guardians",
            component: GuardianMain,
          },
          {
            path: "/manage/guardians/:id",
            name: "GuardianInfo",
            component: GuardianInfo,
          },
        ],
      },
      {
        path: "/manage/students",
        component: Students,
        children: [
          {
            path: "/manage/students",
            component: StudentMain,
            name: "StudentMain",
          },
          {
            path: "/manage/students/:id",
            name: "StudentInfo",
            component: StudentInfo,
          },
          {
            path: "/manage/wait-list/students/:id",
            name: "WaitListStudentInfo",
            component: WaitListEdit,
          },
        ],
      },
      {
        path: "/manage/classes",
        component: Classes,
        children: [
          {
            path: "/manage/classes",
            name: "AdminClassMain",
            component: ClassMain,
          },
          {
            path: "/manage/classes/:id",
            name: "ClassInfo",
            component: ClassInfo,
          },
        ],
      },
      {
        path: "/manage/library",
        component: Library,
      },
      {
        path: "/manage/bills",
        component: Bills,
        children: [
          {
            path: "/manage/bills",
            component: BillsMain,
            name: "AdminBillsMain",
          },
          {
            path: "/manage/bills/guardian/:id",
            name: "GuardianInvoiceInfo",
            component: GuardianInvoiceInfo,
          },
          {
            path: "/manage/bills/teacher/:id",
            name: "TeacherInvoiceInfo",
            component: TeacherInvoiceInfo,
          },
        ],
      },
      {
        path: "/manage/expenses",
        component: Expenses,
      },
    ],
  },
];

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes,
});

export default router;
