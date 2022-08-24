<template>
  <router-view />
</template>

<style>
@import url("https://fonts.googleapis.com/css2?family=Merienda&display=swap");

*,
html,
body {
  margin: 0;
  padding: 0;
}
:root {
  --color-0: #fff;
  --color-1: #2c736c;
  --color-1_1: #ccffe8;
  --color-2: #34495e;
  --color-3: #7e7c84;
  --color-3_3: #9d9ca1;
  --color-4: #f58d5f;
  --color-4_1: #ffd7c5;
  --color-5: #ff6d6d;
  /* --color-0:#FFF;
    --color-1: #2c736c;
    --color-1_1: #ccffe8;
    --color-2: #34495e;
    --color-3: #000;
    --color-3_3: #e9ecef; 
    --color-4:#f58d5f;
    --color-4_1:#e9ecef;
    --color-5:#ff6d6d; */
}
body {
  background-color: #cecfcf80;
  font-family: Karla, sans-serif;
  /* color: #2c3e50; */
}
a,
a:hover {
  text-decoration: none;
  color: #fff;
}
.f-color-0 {
  color: var(--color-0) !important;
}
.b-color-0 {
  background-color: var(--color-0) !important;
}
.f-color-1 {
  color: var(--color-1) !important;
}
.b-color-1 {
  background-color: var(--color-1);
}
.f-color-1_1 {
  color: var(--color-1_1) !important;
}
.b-color-1_1 {
  background-color: var(--color-1_1);
}
.f-color-2 {
  color: var(--color-2);
}
.b-color-2 {
  background-color: var(--color-2);
}
.f-color-3 {
  color: var(--color-3) !important;
}
.b-color-3 {
  background-color: var(--color-3) !important;
}
.f-color-3_3 {
  color: var(--color-3_3) !important;
}
.b-color-3_3 {
  background-color: var(--color-3_3) !important;
}
.f-color-4 {
  color: var(--color-4) !important;
}
.b-color-4 {
  background-color: var(--color-4) !important;
}
.f-color-4_1 {
  color: var(--color-4_1) !important;
}
.b-color-4_1 {
  background-color: var(--color-4_1) !important;
}
.f-color-5 {
  color: var(--color-5) !important;
}
.b-color-5 {
  background-color: var(--color-5) !important;
}
.alert-success {
  color: #0a865e;
  background-color: #d1fff1;
  border: none;
}
.alert-warning {
  color: #f58d5f;
  background-color: #ffd7c5;
  border: none;
}
input:focus,
textarea:focus,
select:focus {
  outline: none;
}
.form-control::placeholder {
  color: var(--color-3_3) !important;
  font-size: 90%;
}
.form-control:focus,
.form-select:focus {
  box-shadow: none;
  border-color: var(--color-1);
}
.form-control {
  padding: 0.57rem 0.75rem;
}
.form-select {
  color: var(--color-3_3);
  font-size: 90%;
  padding: 0.6299rem 0.75rem;
}
.main-button-style {
  background-color: var(--color-1);
  color: var(--color-2);
  border: initial;
}
.soft-button-style {
  background-color: #80dcb3;
  color: var(--color-0);
  border: initial;
}
.main-button-style:hover,
.soft-button-style:hover {
  transition: 0.3s ease-in-out;
  background-color: #4dad82;
  cursor: pointer;
}
.main-button-style:focus,
.soft-button-style:focus {
  background-color: #3f9b71;
}
.delete-btn,
.secondery-btn {
  opacity: 0.8;
  border-radius: 2px;
  cursor: pointer;
}
.delete-btn {
  background-color: #ffd2d2;
  color: #ff6d6d;
}
.secondery-btn {
  background-color: var(--color-4_1);
  color: var(--color-4);
}
.delete-btn:hover,
.secondery-btn:hover {
  transition: 0.25s ease-in-out;
  opacity: 1;
}
.with-100px {
  width: 100px;
}
.letter-spacing {
  letter-spacing: 1px;
}
.box-shadow-style {
  box-shadow: 3px 2px 13px 0px #ebebfe2e;
}
.z-index-1 {
  z-index: 1;
}
.cursor-pointer {
  cursor: pointer;
}
.background-none {
  background: none;
}
.text-on-hover:hover {
  cursor: pointer;
  transition: 0.25s ease-in-out;
  color: #1ba769 !important;
}
.opacity-100-on-hover:hover {
  cursor: pointer;
  opacity: 1 !important;
  transition: 0.25s ease-in-out;
}
.pagination-container {
  display: flex;
  column-gap: 10px;
}
.paginate-buttons {
  height: 40px;
  width: 40px;
  border-radius: 20px;
  cursor: pointer;
  background-color: transparent;
  border: none;
  color: black;
}
.paginate-buttons:hover {
  background-color: #d8d8d8;
}
.active-page {
  background-color: #3498db;
  border: 1px solid #3498db;
  color: white;
}
.active-page:hover {
  background-color: #2988c8;
}

.rowTable {
  background-color: #ededed;
  color: #181818;
  border-radius: 15px;
  cursor: grab;
}
.rowTable:hover {
  background-color: #dfdfdf;
}
</style>
