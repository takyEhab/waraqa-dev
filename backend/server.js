const express = require("express");
const app = express();
const cors = require("cors");
const moment = require("moment-timezone");
require("dotenv").config();

const bodyParser = require("body-parser");
// const mongoose = require('mongoose');

// 64.227.76.156

// Routes
const apiRoutes = require("./Routes/Api");
const authRoutes = require("./Routes/Auth");

app.use(cors());

let dd = "2022-04-21 18:41:00";
console.log(
  "AA",
  moment(dd).utc(moment(dd).utc()).format("YYYY-MM-DD HH:mm:ss")
);
console.log("BB", moment.utc(moment(dd).utc()).format("YYYY-MM-DD HH:mm:ss"));
console.log("CC", moment(dd).utc(moment(dd)).format());
console.log("dd", moment(dd, "YYYY-MM-DD HH:mm:ss"));
console.log("XX", moment(moment(dd, "YYYY-MM-DD HH:mm:ss")).format());

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

// Use Routes
app.use("/api", apiRoutes);
app.use("/auth", authRoutes);

// Handle production
// if (process.env.NODE_ENV === 'production') { //will be true in heroku
// Static folder
// app.use(express.static(__dirname + '/public/'));

// Handle SPA
// app.get(/.*/, (req, res) => res.sendFile(__dirname + '/public/index.html'));
// }

app.listen(process.env.PORT || 3000, () =>
  console.log(`Server is running, PORT : ${process.env.PORT || 3000} `)
);
