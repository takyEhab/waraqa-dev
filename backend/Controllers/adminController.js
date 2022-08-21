const { validationResult } = require("express-validator");
const bcrypt = require("bcrypt-nodejs");
const dataBase = require("../Database/Config.js");
const moment = require("moment-timezone");
const {
  sendEmail,
  sendNotification,
} = require("./NotificationAndEmailController");

/* ********* Guardian controller Start*********** */
let allGuardians = (req, res) => {
  let queryReq = req.query;
  let search = queryReq.search;
  let offset = queryReq.offset;
  // let invoiceCreatedDate= `(SELECT establishedAt FROM guardianinvoices WHERE guardianID=students.guardianID ORDER BY establishedAt DESC LIMIT 1)`

  let query = `SELECT guardians.*,count(*) OVER() AS fullCount, COUNT(students.guardianID) AS studentsCount,
                    (SELECT SUM(students.attendedHours) 
                        FROM students
                        WHERE students.guardianID = guardians.id 

                    ) AS hours,

                    (SELECT SUM(savedPaidHours)
                        FROM guardianinvoices
                        INNER JOIN guardians 
                        ON guardianinvoices.guardianID = guardians.id
                        WHERE guardians.id = students.guardianID 
                    ) AS savedPaidHours

                FROM guardians
                LEFT JOIN students
                ON students.guardianID = guardians.id
                ${
                  search
                    ? ` WHERE guardians.name LIKE '%${search}%' OR guardians.email LIKE '%${search}%' OR guardians.phone LIKE '%${search}%' `
                    : ""
                }
                GROUP BY 1
                ORDER BY guardians.name
                ${offset ? `LIMIT 30 OFFSET ${offset}` : ""}
                `;
  dataBase.query(query, (error, data) => {
    if (error || !data.length) {
      return res.json({
        success: false,
        msg: "There are no results available to display.",
        error: error,
      });
    }
    res.json({ success: true, rows: data });
  });
};

/* ********* Students controller Start*********** */
// Path0: Fetch all students
let allStudents = (req, res, next) => {
  let queryReq = req.query;
  let search = queryReq.search;
  let status = queryReq.status;
  let offset = queryReq.offset;

  // let invoiceCreatedDate= `(SELECT establishedAt FROM guardianinvoices WHERE guardianID=students.guardianID ORDER BY establishedAt DESC LIMIT 1)`

  // (SELECT SUM(classes.duration)
  // FROM classes
  // INNER JOIN students
  // ON classes.studentID = students.id
  // INNER JOIN guardianinvoices
  // ON guardianinvoices.guardianID = students.guardianID
  // WHERE classes.studentID != students.id AND countForStudent = 1
  // AND (
  //         (guardianinvoices.paid=1 AND classes.invoiceID=guardianinvoices.id)
  //     OR
  //         (guardianinvoices.paid!=1 AND classes.startingDate BETWEEN ${invoiceCreatedDate} AND (${invoiceCreatedDate} + INTERVAL 1 MONTH))
  //     )
  // ) AS hoursOfOthers

  // (SELECT SUM(classes.duration)
  // FROM classes
  // WHERE classes.studentID = students.id
  // AND (status=1 OR status = 4) AND countForStudent = 1
  // ) AS hours,

  query = `SELECT students.*, count(*) OVER() AS fullCount, guardians.name AS guardianName, 

                    (SELECT SUM(classes.duration)
                    FROM classes
                    INNER JOIN guardianinvoices
                    ON classes.invoiceID = guardianinvoices.id
                    WHERE classes.studentID = students.id 
                    AND classes.invoiceID IS NOT NULL
                    AND countForStudent = 1
                    ) AS savedPaidHours

                FROM students
                INNER JOIN guardians
                ON students.guardianID = guardians.id
                ${status ? ` WHERE students.status = ${status}` : ""}
                ${
                  search
                    ? ` AND ( students.name LIKE '%${search}%' OR  guardians.name LIKE '%${search}%' OR  guardians.email LIKE '%${search}%' ) `
                    : ""
                }
                ORDER BY students.name
                ${offset ? `LIMIT 30 OFFSET ${offset}` : ""}
                `;

  msg = "There are no results available to display.";
  return next();
};

// Path1: Add students in Wait-list
let addStudentInWait = (req, res) => {
  let query = `INSERT INTO waitlist SET ?`;
  dataBase.query(query, req.body, (error, data) => {
    if (error || !data) {
      return res.json({ success: false, msg: "Failed add the student" });
    }
    res.json({
      success: true,
      msg: "The student registered successfully in Wait-list",
    });
  });
};

/* ********* Teacher controller Start*********** */
// Path0: Fetch all Teachers
let allTeachers = (req, res, next) => {
  let queryReq = req.query;
  let search = queryReq.search;
  let status = queryReq.status;
  let offset = queryReq.offset;
  // let invoiceCreatedDate= `(SELECT createdAt FROM teacherinvoices WHERE teacherID=classes.teacherID ORDER BY createdAt DESC LIMIT 1)`

  let firstDateOfThisMonth = moment()
    .startOf("month")
    .format("YYYY-MM-DD HH:mm:ss"); // first date of this month
  let lastDateOfThisMonth = moment()
    .endOf("month")
    .format("YYYY-MM-DD HH:mm:ss"); //last date of this month

  console.log("dates ", firstDateOfThisMonth, lastDateOfThisMonth);
  // (SELECT SUM(classes.duration)
  // FROM classes
  // WHERE classes.teacherID = teachers.id
  // AND (status=1 OR status=4) AND countForTeacher=1
  // AND classes.startingDate BETWEEN '${firstDateOfThisMonth}' AND '${lastDateOfThisMonth}'
  // ) AS hours
  query = `SELECT teachers.*, count(*) OVER() AS fullCount,
                    (SELECT COUNT (DISTINCT classes.studentID)
                    FROM classes
                    INNER JOIN students
                    ON students.id = classes.studentID
                    WHERE classes.teacherID = teachers.id 
                    AND students.status = 1
                    ) AS studentsCount

 
                    FROM teachers
                WHERE 1=1
                ${status ? `AND teachers.status = ${status}` : ""}
                ${
                  search
                    ? ` AND ( teachers.name LIKE '%${search}%' OR teachers.email LIKE '%${search}%' OR teachers.phone LIKE '%${search}%' ) `
                    : ""
                }
                ORDER BY teachers.name
                ${offset ? `LIMIT 30 OFFSET ${offset}` : ""}
                `;
  // AND (status = 1 OR status = 4)) AS hours
  msg = "There are no results available to display.";
  return next();
};

/* ********* Classes controller Start*********** */
// let OLDaddClass = (req, res)=>{
//     // return res.json({BB:req.body})
//     let insertInScheduledClasses = ()=>{
//         let scheduledClasses = weeklyDaysTimes
//         scheduledClasses.studentID=studentID
//         scheduledClasses.teacherID=teacherID
//         let query = `INSERT INTO scheduledclasses SET ?`;
//         dataBase.query(query,scheduledClasses, (error, data)=>{
//         if(error || !data){
//             return console.log("Failed Scheduled Classes!", error)
//         }
//         console.log("The Classes scheduled successfully")
//     })
//     }
//     // return res.json({BB:req.body})
//     let insertClass = (sqlValues)=>{
//         let query = `INSERT INTO classes (teacherID, studentID, subject, classTitle, startingDate, duration, guests, description, timeZone,countForTeacher, countForStudent, invoiceID) VALUES ? `
//         dataBase.query(query,[sqlValues],(error, data)=>{
//             if(error || !data){
//                 return res.json({success:false, msg:"Failed store classes", error:error});
//             }
//             if(bodyData.length > 1){ //Save in ScheduledClasses, don't consider the first (of the Starting Date field)
//                 insertInScheduledClasses()
//             }
//             //Send Emails and notifications
//             let usersNames = `SELECT (SELECT name FROM teachers WHERE id = ${teacherID}) AS teacherName,
//                         (SELECT name FROM students WHERE id = ${studentID}) AS studentName,
//                         (SELECT email FROM teachers WHERE id = ${teacherID}) AS teacherEmail,
//                         (SELECT classLink FROM teachers WHERE id = ${teacherID}) AS classLink,
//                         (SELECT email FROM guardians WHERE id = ${guardianID}) AS guardianEmail
//             `
//             dataBase.query(usersNames, (error, data)=>{
//                 if(error || !data.length){
//                     console.log("We can't get names")
//                 }
//                 let teacherName = data[0].teacherName;
//                 let studentName = data[0].studentName;
//                 let teacherEmail = data[0].teacherEmail;
//                 let guardianEmail = data[0].guardianEmail;
//                 let classLink = data[0].classLink;
//                 ////////////////////////////////////////////////////////////////////////////////////////////
//                 //Config Admin Email
//                 configAdminEmail = {
//                     subject : 'A new lesson is added',
//                     html:`
//                         <p>Admin "${tokenData.name}" has added a new class for the student "${studentName}".</p>
//                         <p>${subject} start on ${emailClassesDetails[0]} with the teacher "${teacherName}" according to the following schedule:</p>
//                         `
//                 }
//                 for (var i in emailClassesDetails){
//                     configAdminEmail.html += `<p>${emailClassesDetails[i]}</p>`
//                 }
//                 sendEmail(configAdminEmail);
//                 ////////////////////////////////////////////////////////////////////////////////////////////
//                 //Config Teacher Email
//                 configTeacherEmail = {
//                     to:teacherEmail,
//                     subject : 'A new lesson is added',
//                     html:`
//                         <p>Assalamu alaykum,</p>
//                         <p>We hope you are doing well,</p>
//                         <p>Admin "${tokenData.name}" has added a new class for you.</p>
//                         <p>${subject} start on ${emailClassesDetails[0]} with the student "${studentName}" according to the following schedule:</p>
//                         `
//                 }
//                 for (var i in emailClassesDetails){
//                     configTeacherEmail.html += `<p>${emailClassesDetails[i]}</p>`
//                 }
//                 configTeacherEmail.html += `<p>Please bookmark the following link to easily join the lesson. Join from PC, Mac, Linux, iOS or Android by clicking on the link: <a href="${classLink}" target="_blank">class zoom link</a>
//                                             Kindly, set the password to: 1234</p>
//                                             <p>Best regards</p>
//                                             `
//                 sendEmail(configTeacherEmail);
//                 ////////////////////////////////////////////////////////////////////////////////////////////
//                 //Config Guardian Email
//                 configGuardianEmail = {
//                     to:guardianEmail,
//                     subject : 'A new lesson is added',
//                     html:`
//                         <p>Assalamu alaykum,</p>
//                         <p>We hope you are doing well,</p>
//                         <p>Admin "${tokenData.name}" has added a new class for you.</p>
//                         <p>${subject} start on ${emailClassesDetails[0]} with the teacher "${teacherName}" according to the following schedule:</p>
//                         `
//                 }
//                 for (var i in emailClassesDetails){
//                     configGuardianEmail.html += `<p>${emailClassesDetails[i]}</p>`
//                 }
//                 configGuardianEmail.html += `<p>Please bookmark the following link to easily join the lesson. Join from PC, Mac, Linux, iOS or Android by clicking on the link: <a href="${classLink}" target="_blank">class zoom link</a>
//                                             Kindly, set the password to: 1234</p>
//                                             <p>Best regards</p>
//                                             `
//                 sendEmail(configGuardianEmail);
//                 ////////////////////////////////////////////////////////////////////////////////////////////
//                 //Config Guest Email
//                 configGuestEmail = {
//                     to:guests,
//                     subject : 'A new lesson is added',
//                     html:`
//                         <p>Assalamu alaykum,</p>
//                         <p>We hope you are doing well,</p>
//                         <p>The administrator, "${tokenData.name}", cordially invites you to these classes.</p>
//                         <p>${subject} start on ${emailClassesDetails[0]} with the teacher "${teacherName}" according to the following schedule:</p>
//                         `
//                 }
//                 for (var i in emailClassesDetails){
//                     configGuestEmail.html += `<p>${emailClassesDetails[i]}</p>`
//                 }
//                 configGuestEmail.html += `<p>Please bookmark the following link to easily join the lesson. Join from PC, Mac, Linux, iOS or Android by clicking on the link: <a href="${classLink}" target="_blank">class zoom link</a>
//                                             Kindly, set the password to: 1234</p>
//                                             <p>Best regards</p>
//                                             `
//                 sendEmail(configGuestEmail);
//                 ///////////////////////////////////////////////////////////////////////////////////////////////////
//                 //Config Notification
//                 notiConfig = {
//                     type:2,
//                     admin:1,
//                     teacherID:teacherID,
//                     guardianID:guardianID,
//                     studentID:studentID,
//                     adminMsg:`Admin "${tokenData.name}" has added a new class for the student "${studentName}". <br> ${subject} start on ${emailClassesDetails[0]} with the teacher "${teacherName}" according to the following schedule: <br>`,
//                     teacherMsg:`Admin "${tokenData.name}" has added a new class for you. <br> ${subject} start on ${emailClassesDetails[0]} with the student "${studentName}" according to the following schedule: <br>`,
//                     guardianMsg:`Admin "${tokenData.name}" has added a new class for "${studentName}". <br> ${subject} start on ${emailClassesDetails[0]} with the teacher "${teacherName}" according to the following schedule: <br>`
//                 }
//                 for (var i in emailClassesDetails){
//                     notiConfig.adminMsg += `${emailClassesDetails[i]}<br>`
//                     notiConfig.teacherMsg += `${emailClassesDetails[i]}<br>`
//                     notiConfig.guardianMsg += `${emailClassesDetails[i]}<br>`
//                 }
//                 //Send Notification
//                 sendNotification(notiConfig);
//                 //////////////////////////////////////////////////////////////////////////////////////////////////////////
//             })

//             res.json({success:true, msg:"Great, the classes have been successfully added."});
//         })
//     }

//     // Step1 : Get guardianID by the studentID
//     // Step2: Check guardian has unpaid Inovice
//         //Step3: IF exists unpaid inovice : Get invoiceID
//             // Step3.1 Save classes (Contain invoiceID)
//         //Step4: IF not exists unpaid : Create Inovice and store guardianID in it
//             // Step5: Save classes (Contain invoiceID)

//     // Step1 : Get guardianID
//     let guardianID = req.body[0].guardianID;
//     const weeklyDaysTimes = req.body[0].weeklyDaysTimes;
//     let studentID = req.body[0].studentID;
//     let teacherID = req.body[0].teacherID;
//     let subject = req.body[0].subject;
//     let guests = req.body[0].guests;
//     let bodyData = req.body;
//     // Delete guardian from bodyData
//     delete bodyData[0].guardianID;
//     delete bodyData[0].weeklyDaysTimes;
//     if(bodyData.length > 1){ //On repated Class, don't consider the first (of the Starting Date field)
//         bodyData.shift()
//     }
//     // format('ddd, D MMM YYYY, HH:mm') )})
//     let emailClassesDetails = [];
//     bodyData.forEach(obj => {emailClassesDetails.push(moment(obj.startingDate).format('dddd, D MMM , hh:mm A') )})

//     // Add free classes
//     if(!req.body[0].countForStudent || !req.body[0].countForTeacher){
//         // Add invoiceID to each Object
//         bodyData.forEach(obj => {obj.invoiceID=null})

//         // Convert the array of objects to array of arrays
//         sqlValues = bodyData.map(object => Object.values(object))

//         insertClass(sqlValues);
//         return
//     }
//     console.log('It still here')

//     // Step2: Check guardian has unpaid Inovice
//     dataBase.query(`SELECT guardianinvoices.id FROM guardianinvoices WHERE guardianID = ${guardianID} AND paid=2`, (error, data)=>{
//         //Step4: IF not exist unpaid : Create Inovice and store guardianID in it
//         if(error || !data.length){
//             // Create Inovice and store guardianID in it
//             dataBase.query(`INSERT INTO guardianinvoices SET ?`, {guardianID:guardianID} ,(error, data)=>{
//                 if(error || !data){
//                     return res.json({success:false, msg:"Failed Open new invoice[1]"});
//                 }
//                 // Get ID of invoice that inserted
//                 let invoiceID = data.insertId;
//                 // Add invoiceID to each Object
//                 bodyData.forEach(obj => {obj.invoiceID=invoiceID})

//                 //Convert the array of objects to array of arrays
//                 sqlValues = bodyData.map(object => Object.values(object))

//                 // Step5: Save classes (Contain invoiceID)
//                 insertClass(sqlValues);
//             })
//         }else{
//             //Step3: IF exist unpaid inovice : Get invoiceID
//             let invoiceID = data[0].id
//             // Step3.1 Save classes (Contain invoiceID)

//             // Add invoiceID to each Object
//             bodyData.forEach(obj => {obj.invoiceID=invoiceID})

//             //Convert the array of objects to array of arrays
//             sqlValues = bodyData.map(object => Object.values(object))

//             // Step3.1 Save classes (Contain invoiceID)
//             insertClass(sqlValues);
//         }
//     })

// }
let addClass = (req, res) => {
  //Insert in Scheuled
  //Get inserted id
  //Fetch from Scheuled
  // Insert classes
  // return res.json({BB:req.body})
  let insertInScheduledClasses = () => {
    let scheduledClasses = weeklyDaysTimes;
    scheduledClasses.guardianID = guardianID;
    scheduledClasses.teacherID = bodyData[0].teacherID;
    scheduledClasses.studentID = bodyData[0].studentID;
    scheduledClasses.subject = bodyData[0].subject;
    scheduledClasses.classTitle = bodyData[0].classTitle;
    // scheduledClasses.startingDate = day.format("YYYY-MM-DD HH=mm").toString()
    scheduledClasses.payEvery = req.body.payEvery;

    scheduledClasses.duration = bodyData[0].duration;
    scheduledClasses.guests = bodyData[0].guests;
    scheduledClasses.description = bodyData[0].description;
    scheduledClasses.timeZone = bodyData[0].timeZone;
    bodyData[0].countForTeacher ? (scheduledClasses.countForTeacher = 1) : 0;
    bodyData[0].countForStudent ? (scheduledClasses.countForStudent = 1) : 0;

    let query = `INSERT INTO scheduledclasses SET ?`;
    dataBase.query(query, scheduledClasses, (error, data) => {
      if (error || !data) {
        return console.log("Failed Scheduled Classes!", error);
      }
      let scheduleID = data.insertId;
      //Add classes with scheduledID

      // This section copyed from Classes.Controller.RescheduleClasses()
      let query = `SELECT * FROM scheduledclasses WHERE id = ${scheduleID} ORDER BY createdAt DESC`;
      dataBase.query(query, (error, data) => {
        if (error || !data.length) {
          return console.log("Failed Find scheduledclasses Classes!");
        }

        let classes = [];
        let selectedDays = {};
        let times = {};

        if (data[0].Sun) {
          selectedDays.Sun = "Sun";
          times.Sun = moment(data[0].Sun).format("HH:mm");
        }
        if (data[0].Mon) {
          selectedDays.Mon = "Mon";
          times.Mon = moment(data[0].Mon).format("HH:mm");
        }
        if (data[0].Tue) {
          selectedDays.Tue = "Tue";
          times.Tue = moment(data[0].Tue).format("HH:mm");
        }
        if (data[0].Wed) {
          selectedDays.Wed = "Wed";
          times.Wed = moment(data[0].Wed).format("HH:mm");
        }
        if (data[0].Thu) {
          selectedDays.Thu = "Thu";
          times.Thu = moment(data[0].Thu).format("HH:mm");
        }
        if (data[0].Fri) {
          selectedDays.Fri = "Fri";
          times.Fri = moment(data[0].Fri).format("HH:mm");
        }
        if (data[0].Sat) {
          selectedDays.Sat = "Sat";
          times.Sat = moment(data[0].Sat).format("HH:mm");
        }

        let start = moment(bodyData[0].startingDate).format("YYYY-MM-DD");
        let end = moment(bodyData[0].startingDate).add(data[0].payEvery, "M");
        //Convert times to array
        let timesOfDays = Object.values(times);
        // timesOfDays = timesOfDays.filter(item => item !== "");

        //Convert days to array
        let selectedDaysArray = Object.values(selectedDays);
        // selectedDaysArray = selectedDaysArray.filter(item => item !== "");
        for (let i = 0; i < selectedDaysArray.length; i++) {
          let day = moment(start + " " + timesOfDays[i]).day(
            selectedDaysArray[i]
          );

          if (moment(day).isBefore(start)) day.add(7, "d");
          while (day.isBefore(end)) {
            let weeklyClass = {
              teacherID: data[0].teacherID,
              studentID: data[0].studentID,
              subject: data[0].subject,
              classTitle: data[0].classTitle,
              startingDate: day.format("YYYY-MM-DD HH:mm").toString(),
              duration: data[0].duration,
              guests: data[0].guests,
              description: data[0].description,
              timeZone: data[0].timeZone,
              countForTeacher: data[0].countForTeacher ? 1 : 0,
              countForStudent: data[0].countForStudent ? 1 : 0,
            };
            classes.push(weeklyClass);
            day.add(7, "d");
          }
        }

        //Step : Insert Classes
        // Add scheduleID to each Object
        classes.forEach((obj) => {
          obj.scheduleID = scheduleID;
        });
        console.log(classes);
        //Convert the array of objects to array of arrays
        sqlValues = classes.map((object) => Object.values(object));
        insertClass(sqlValues);
      });

      /*
            // Add scheduleID to each Object
            bodyData.forEach(obj => {obj.scheduleID=scheduleID})
        
            //Convert the array of objects to array of arrays
            sqlValues = bodyData.map(object => Object.values(object))

            // Step5: Save classes (Contain invoiceID)
            insertClass(sqlValues);
            */

      console.log("The Classes scheduled successfully");
    });
  };
  let insertClass = (sqlValues) => {
    let query = `INSERT INTO classes (teacherID, studentID, subject, classTitle, startingDate, duration, guests, description, timeZone,countForTeacher, countForStudent, scheduleID) VALUES ? `;
    dataBase.query(query, [sqlValues], (error, data) => {
      if (error || !data) {
        console.log(error);
        return res.json({
          success: false,
          msg: "Failed store classes",
          error: error,
        });
      }
      //Send Emails and notifications
      let usersNames = `SELECT (SELECT name FROM teachers WHERE id = ${teacherID}) AS teacherName,
                        (SELECT name FROM students WHERE id = ${studentID}) AS studentName,
                        (SELECT email FROM teachers WHERE id = ${teacherID}) AS teacherEmail,
                        (SELECT classLink FROM teachers WHERE id = ${teacherID}) AS classLink,
                        (SELECT email FROM guardians WHERE id = ${guardianID}) AS guardianEmail
            `;
      dataBase.query(usersNames, (error, data) => {
        if (error || !data.length) {
          console.log("We can't get names");
        }
        let teacherName = data[0].teacherName;
        let studentName = data[0].studentName;
        let teacherEmail = data[0].teacherEmail;
        let guardianEmail = data[0].guardianEmail;
        let classLink = data[0].classLink;
        ////////////////////////////////////////////////////////////////////////////////////////////
        //Config Admin Email
        configAdminEmail = {
          subject: "A new lesson is added",
          html: `
                        <p>Admin "${tokenData.name}" has added a new class for the student "${studentName}".</p>
                        <p>${subject} start on ${emailClassesDetails[0]} with the teacher "${teacherName}" according to the following schedule:</p>
                        `,
        };
        for (var i in emailClassesDetails) {
          configAdminEmail.html += `<p>${emailClassesDetails[i]}</p>`;
        }
        sendEmail(configAdminEmail);
        ////////////////////////////////////////////////////////////////////////////////////////////
        //Config Teacher Email
        configTeacherEmail = {
          to: teacherEmail,
          subject: "A new lesson is added",
          html: `<p>Assalamu alaykum,</p>
          <p>We hope you are doing well,</p>
          <p>Admin "${tokenData.name}" has added a new class for you.</p>
          <p>${subject} start on ${emailClassesDetails[0]} with the student "${studentName}" according to the following schedule:</p>`,
        };

        for (var i in emailClassesDetails) {
          configTeacherEmail.html += `<p>${emailClassesDetails[i]}</p>`;
        }
        configTeacherEmail.html += `<p>Please bookmark the following link to easily join the lesson. Join from PC, Mac, Linux, iOS or Android by clicking on the link: <a href="${classLink}" target="_blank">class zoom link</a>
                                            Kindly, set the password to: 1234</p> 
                                            <p>Best regards</p>           
                                            `;
        sendEmail(configTeacherEmail);
        ////////////////////////////////////////////////////////////////////////////////////////////
        //Config Guardian Email
        configGuardianEmail = {
          to: guardianEmail,
          subject: "A new lesson is added",
          html: `
                        <p>Assalamu alaykum,</p>
                        <p>We hope you are doing well,</p>
                        <p>Admin "${tokenData.name}" has added a new class for you.</p>
                        <p>${subject} start on ${emailClassesDetails[0]} with the teacher "${teacherName}" according to the following schedule:</p>
                        `,
        };
        for (var i in emailClassesDetails) {
          configGuardianEmail.html += `<p>${emailClassesDetails[i]}</p>`;
        }
        configGuardianEmail.html += `<p>Please bookmark the following link to easily join the lesson. Join from PC, Mac, Linux, iOS or Android by clicking on the link: <a href="${classLink}" target="_blank">class zoom link</a>
                                            Kindly, set the password to: 1234</p> 
                                            <p>Best regards</p>           
                                            `;
        sendEmail(configGuardianEmail);
        ////////////////////////////////////////////////////////////////////////////////////////////
        //Config Guest Email
        configGuestEmail = {
          to: guests,
          subject: "A new lesson is added",
          html: `
                        <p>Assalamu alaykum,</p>
                        <p>We hope you are doing well,</p>
                        <p>The administrator, "${tokenData.name}", cordially invites you to these classes.</p>
                        <p>${subject} start on ${emailClassesDetails[0]} with the teacher "${teacherName}" according to the following schedule:</p>
                        `,
        };
        for (var i in emailClassesDetails) {
          configGuestEmail.html += `<p>${emailClassesDetails[i]}</p>`;
        }
        configGuestEmail.html += `<p>Please bookmark the following link to easily join the lesson. Join from PC, Mac, Linux, iOS or Android by clicking on the link: <a href="${classLink}" target="_blank">class zoom link</a>
                                            Kindly, set the password to: 1234</p> 
                                            <p>Best regards</p>           
                                            `;
        sendEmail(configGuestEmail);
        ///////////////////////////////////////////////////////////////////////////////////////////////////
        //Config Notification
        notiConfig = {
          type: 2,
          admin: 1,
          teacherID: teacherID,
          guardianID: guardianID,
          studentID: studentID,
          adminMsg: `Admin "${tokenData.name}" has added a new class for the student "${studentName}". <br> ${subject} start on ${emailClassesDetails[0]} with the teacher "${teacherName}" according to the following schedule: <br>`,
          teacherMsg: `Admin "${tokenData.name}" has added a new class for you. <br> ${subject} start on ${emailClassesDetails[0]} with the student "${studentName}" according to the following schedule: <br>`,
          guardianMsg: `Admin "${tokenData.name}" has added a new class for "${studentName}". <br> ${subject} start on ${emailClassesDetails[0]} with the teacher "${teacherName}" according to the following schedule: <br>`,
        };
        for (var i in emailClassesDetails) {
          notiConfig.adminMsg += `${emailClassesDetails[i]}<br>`;
          notiConfig.teacherMsg += `${emailClassesDetails[i]}<br>`;
          notiConfig.guardianMsg += `${emailClassesDetails[i]}<br>`;
        }
        //Send Notification
        sendNotification(notiConfig);
        //////////////////////////////////////////////////////////////////////////////////////////////////////////
      });

      res.json({
        success: true,
        msg: "Great, the classes have been successfully added.",
      });
    });
  };

  // Step1 : Get guardianID by the studentID
  // --------------Step2: Check guardian has unpaid Inovice
  // Step2: Check guardian has an Inovice
  //IF exists     : Step3: Guardian has Invoice go to Step5 or Step6
  //IF not exists : Step4: Create inactive Inovice and store guardianID in it
  //Step5: IF Weekly classes, Save classes with scheduleID=data.insertId
  //Step6: IF One class, Save classes with scheduleID=null
  //Step7: IF this teacher has no invoice && this classes is counted for him : Create his first inactive invoice

  /*
    -----------------------
    //Step3: IF exists unpaid inovice : Get invoiceID
        // Step3.1 Save classes (Contain invoiceID)
    //Step4: IF not exists unpaid : Create Inovice and store guardianID in it 
        // Step5: Save classes (Contain invoiceID)
    ---------------------
    */

  // Step1 : Get guardianID
  let bodyData = req.body.classes;
  let guardianID = bodyData[0].guardianID;
  const weeklyDaysTimes = bodyData[0].weeklyDaysTimes;
  if (weeklyDaysTimes.Sun) {
    weeklyDaysTimes.Sun = moment(weeklyDaysTimes.Sun).format(
      "YYYY-MM-DD HH:mm:ss"
    );
  }
  if (weeklyDaysTimes.Mon) {
    weeklyDaysTimes.Mon = moment(weeklyDaysTimes.Mon).format(
      "YYYY-MM-DD HH:mm:ss"
    );
  }
  if (weeklyDaysTimes.Tue) {
    weeklyDaysTimes.Tue = moment(weeklyDaysTimes.Tue).format(
      "YYYY-MM-DD HH:mm:ss"
    );
  }
  if (weeklyDaysTimes.Wed) {
    weeklyDaysTimes.Wed = moment(weeklyDaysTimes.Wed).format(
      "YYYY-MM-DD HH:mm:ss"
    );
  }
  if (weeklyDaysTimes.Thu) {
    weeklyDaysTimes.Thu = moment(weeklyDaysTimes.Thu).format(
      "YYYY-MM-DD HH:mm:ss"
    );
  }
  if (weeklyDaysTimes.Fri) {
    weeklyDaysTimes.Fri = moment(weeklyDaysTimes.Fri).format(
      "YYYY-MM-DD HH:mm:ss"
    );
  }
  if (weeklyDaysTimes.Sat) {
    weeklyDaysTimes.Sat = moment(weeklyDaysTimes.Sat).format(
      "YYYY-MM-DD HH:mm:ss"
    );
  }

  let studentID = bodyData[0].studentID;
  let teacherID = bodyData[0].teacherID;
  let subject = bodyData[0].subject;
  let guests = bodyData[0].guests;

  let countForTeacher = bodyData[0].countForTeacher;
  // Delete guardian from bodyData
  delete bodyData[0].guardianID;
  delete bodyData[0].weeklyDaysTimes;
  // if(bodyData.length > 1){ //On repated Class, don't consider the first (of the Starting Date field)
  //     bodyData.shift()
  // }
  // return console.log(bodyData)
  let startingDate = moment(bodyData[0].startingDate).format(
    "YYYY-MM-DD hh:mm:ss"
  );

  // ddd, D MMM YYYY, HH:mm
  //dddd, hh:mm A
  let emailClassesDetails = [];
  bodyData.forEach((obj) => {
    emailClassesDetails.push(
      moment(obj.startingDate).format("dddd, D MMM , hh:mm A")
    );
  });

  //Should the student have no scheduledclasses with this teacher before.
  let query = `SELECT * FROM scheduledclasses WHERE studentID = ${studentID} AND teacherID = ${teacherID}`;
  dataBase.query(query, (error, data) => {
    if (error) throw error;
    if (data.length > 0 && bodyData.length > 1) {
      if (
        !(
          data[0].description === null &&
          data[0].guests === null &&
          data[0].classTitle === null &&
          data[0].subject === null &&
          data[0].duration === null
        )
      ) {
        return res.json({
          sucess: false,
          msg: "Because this student already has classes with this teacher, you can reschedule them.",
        });
      }
    }
    // delete scheduledclasse if there any

    if (data[0]) {
      dataBase.query(
        `DELETE FROM scheduledclasses WHERE ${data[0].id}`,
        (error, data) => {
          console.log(error ? error : data);
        }
      );
    }
    // Step2: Check guardian has an Inovice
    let query = `SELECT * FROM guardianinvoices WHERE guardianID = ${guardianID} ORDER BY guardianinvoices.createdAt DESC`;
    dataBase.query(query, (error, data) => {
      if (error) {
        return console.log("Failed find the Invoice");
      }
      //Step4: IF not exists : Create inactive Inovice and store guardianID in it
      if (!data.length) {
        //Create inactive Inovice
        dataBase.query(
          `INSERT INTO guardianinvoices SET ?`,
          { guardianID: guardianID, createdAt: startingDate },
          (error, data) => {
            if (error || !data) {
              console.log(error);
              return res.json({
                success: false,
                msg: "Failed create first invoice to this guardian!",
                error: error,
              });
            }
          }
        );
      }
      //Step5: IF Weekly classes, Save classes with scheduleID=data.insertId
      if (bodyData.length > 1) {
        insertInScheduledClasses();
        //Step6: IF One class, Save classes with scheduleID=null
      } else {
        // Add scheduleID=null to each Object
        bodyData[0].scheduleID = null;

        bodyData[0].startingDate = moment(
          bodyData[0].startingDate,
          "YYYY/MM/DD HH:mm:ss"
        ).format("YYYY-MM-DD HH:mm:ss");

        //Convert the array of objects to array of arrays
        sqlValues = bodyData.map((object) => Object.values(object));

        // Step3.1 Save classes
        console.log(sqlValues);
        insertClass(sqlValues);
      }
    });
    //Step7: IF this teacher has no invoice && this classes is counted for him : Create his first inactive invoice
    dataBase.query(
      `SELECT (SELECT COUNT(id) FROM teacherinvoices WHERE id=${teacherID}) AS teacherHasInvoice`,
      (error, data) => {
        if (error) throw error;
        //Create his first inactive invoice
        if (data[0].teacherHasInvoice == 0 && countForTeacher) {
          //Open new Invoice
          let invoiceData = {
            teacherID: teacherID,
          };
          dataBase.query(
            `INSERT INTO teacherinvoices SET ? `,
            [invoiceData],
            (error, data) => {
              if (error || !data) {
                return res.json({
                  success: false,
                  msg: "Failed create teacher invoice to the teacher!",
                });
              }
            }
          );
        }
      }
    );
  });
};

// Path1: Fetch All Classes
let allClasses = (req, res, next) => {
  let queryReq = req.query;
  let userDateTime = queryReq.date;
  let type = queryReq.type; //Previous or Current
  let sign = type == "previous" ? "<" : ">=";
  let status = queryReq.status;
  let search = queryReq.search || "";
  let offset = queryReq.offset;

  query = `SELECT classes.*, count(*) OVER() AS fullCount, teachers.name AS teacherName, students.name AS studentName 
                FROM classes 
                INNER JOIN teachers
                ON classes.teacherID = teachers.id
                INNER JOIN students
                ON classes.studentID = students.id
                ${
                  type == "previous"
                    ? `WHERE (classes.startingDate ${sign} NOW() OR classes.status !=0)`
                    : `WHERE (classes.startingDate ${sign} NOW() AND classes.status =0) AND students.status = 1 AND teachers.status = 1`
                }
                ${status == 0 ? `AND classes.status = 0` : ""}
                ${status == 1 ? `AND classes.status = 1` : ""}
                ${
                  status == 2
                    ? `AND classes.status = 2 OR classes.status = 3 OR classes.status= 6`
                    : ""
                }
                ${
                  status == 3
                    ? `AND classes.status = 4 OR classes.status = 5`
                    : ""
                }
                ${
                  search
                    ? Number(search) == search
                      ? `AND classes.id LIKE '${search}'`
                      : ` AND ( classes.classTitle LIKE '%${search}%' OR students.name LIKE '%${search}%' OR teachers.name LIKE '%${search}%' OR classes.startingDate LIKE '%${search}%' ) `
                    : ""
                }
                 
                ORDER BY startingDate ${type == "previous" ? "DESC" : ""}
                ${offset ? `LIMIT 30 OFFSET ${offset}` : ""}
                `;
  // WHERE classes.startingDate ${sign} '${userDateTime}'
  msg = "There are no results available to display.";
  return next();
};
let classesOfMonth = (req, res, next) => {
  let queryReq = req.query;
  let search = queryReq.search || "";
  let offset = queryReq.offset;

  query = `SELECT classes.*,${
    offset == 0 ? "count(*) OVER() AS fullCount," : ""
  } teachers.name AS teacherName, students.name AS studentName 
                FROM classes 
                INNER JOIN teachers
                ON classes.teacherID = teachers.id
                INNER JOIN students
                ON classes.studentID = students.id
                WHERE classes.startingDate BETWEEN (CURRENT_DATE() - INTERVAL 1 MONTH) AND CURRENT_DATE()
                ${
                  search
                    ? ` AND ( classes.classTitle LIKE '%${search}%' OR classes.id LIKE '%${search}%' OR students.name LIKE '%${search}%' OR teachers.name LIKE '%${search}%' ) `
                    : ""
                }
                AND students.status = 1
                AND teachers.status = 1
                ORDER BY startingDate 
                ${offset ? `LIMIT 30 OFFSET ${offset}` : ""}
                `;
  msg = "There are no results available to display.";
  return next();
};

/* ********* Bills controller Start*********** */
// Path 0: Fetch all guardians' bills
let allGuardiansBills = (req, res, next) => {
  let queryReq = req.query;
  let status = queryReq.status;
  let search = queryReq.search;
  let offset = queryReq.offset;
  query = `SELECT guardianinvoices.*, count(*) OVER() AS fullCount, guardians.name AS guardianName, guardians.paymentType AS paymentType
                FROM guardianinvoices
                INNER JOIN guardians
                ON guardianinvoices.guardianID = guardians.id
                WHERE guardianinvoices.active = 1
                ${
                  search
                    ? Number(search) == search
                      ? `AND guardianinvoices.invoiceNumber LIKE '${search}'`
                      : ` AND (guardians.name LIKE '%${search}%' OR guardians.email LIKE '%${search}%' OR guardians.phone LIKE '%${search}%') `
                    : ""
                }
                ${status ? ` AND guardianinvoices.paid = ${status}` : ""}
                ORDER BY guardianinvoices.createdAt DESC
                ${offset ? `LIMIT 30 OFFSET ${offset}` : ""}
                `;
  msg = "There are no results available to display.";
  return next();
  // ${search ? ` AND (guardians.name LIKE '%${search}%' OR guardians.email LIKE '%${search}%' OR guardians.phone LIKE '%${search}%') OR guardians.invoiceNumber LIKE '%${search}%') `:''}
};

//Path2: Fetch all teachers' bills
let allTeachersBills = (req, res, next) => {
  let queryReq = req.query;
  let status = queryReq.status;
  let search = queryReq.search;
  let offset = queryReq.offset;
  query = `SELECT teacherinvoices.*, count(*) OVER() AS fullCount, teachers.name AS teacherName, 
                    (SELECT SUM(classes.duration) 
                    FROM classes 
                    WHERE classes.teacherID = teachers.id 
                    AND (status = 1 OR status = 4) ) AS minutes
                FROM teacherinvoices
                INNER JOIN teachers
                ON teacherinvoices.teacherID = teachers.id
                WHERE teacherinvoices.active = 1
                ${
                  search
                    ? Number(search) == search
                      ? `AND teacherinvoices.invoiceNumber LIKE '${search}'`
                      : ` AND (teachers.name LIKE '%${search}%' OR teachers.email LIKE '%${search}%' OR teachers.phone LIKE '%${search}%' ) `
                    : ""
                }
                ${status ? ` AND teacherinvoices.paid = ${status}` : ""}
                ORDER BY teacherinvoices.createdAt DESC
                ${offset ? `LIMIT 30 OFFSET ${offset}` : ""}
                `;
  msg = "There are no results available to display.";
  return next();
  //${search ? ` AND (teachers.name LIKE '%${search}%' OR teachers.email LIKE '%${search}%' OR teachers.phone LIKE '%${search}%' ) `:''}
};

//Path 1: Add process (Exponses)
let addProcess = (req, res) => {
  let query = `INSERT INTO expenses SET ?`;
  dataBase.query(query, req.body, (error, data) => {
    if (error || !data) {
      return res.json({
        success: false,
        msg: "Failed add the process",
        error: error,
      });
    }
    res.json({ success: true, msg: "The process saved successfully" });
  });
};
//Path2: Get Expenses
let getExpenses = (req, res, next) => {
  query = `SELECT (SELECT SUM(amount) FROM expenses WHERE process = 'Internet') AS internet,
                    (SELECT SUM(amount) FROM expenses WHERE process = 'Salary') AS salary,
                    (SELECT SUM(amount) FROM expenses WHERE process = 'Bonous') AS bonous,
                    (SELECT SUM(amount) FROM expenses WHERE process = 'Internet') AS internet,
                    (SELECT SUM(amount) FROM expenses WHERE process = 'Marketing') AS marketing,
                    (SELECT SUM(amount) FROM expenses WHERE process = 'Extra fees') AS extraFees,
                    (SELECT SUM(amount) FROM expenses WHERE process = 'Extra income') AS extraIncome,
                    (SELECT SUM(amount) FROM expenses WHERE process = 'Transfer fees') AS transferFees,
                    (SELECT SUM(amount) FROM expenses WHERE process = 'Administrating fees') AS administratingFees,
                    (SELECT SUM(amount) FROM expenses WHERE process = 'Current month invoices') AS currentMonthInvoices,
                    (SELECT SUM(amount) FROM expenses WHERE process = 'Due hours') AS dueHours,
                    (SELECT SUM(amount) FROM expenses WHERE process = 'Done hours') AS doneHours,
                    (SELECT SUM(amount) FROM expenses WHERE process = 'Compesation hours') AS compesationHours
            FROM expenses LIMIT 1`;

  msg = "There are no results available to display.";
  return next();
};

let updateAdmin = (req, res) => {
  let id = req.params.id;

  let email = req.body.email;
  let bodyData = req.body;
  delete bodyData.image;
  delete bodyData.CancelationReq;
  delete bodyData.createdAt;
  /*
        //////
        if(req.file){
            bodyData.picture = req.file.filename
        }
        //////
        */

  //cloudinary
  if (req.file) {
    bodyData.picture = req.file.path;
  }

  //check Email not exists as admin before
  let query = `SELECT (SELECT COUNT(email) FROM admins WHERE email = ?) AS foundAdmin`;
  dataBase.query(query, [email, email], (error, results) => {
    if (error) throw error;
    //If Exist as Guardian OR as Teacher Before
    if (results[0].foundAdmin > 1) {
      return res.json({ success: false, msg: "This Email already exists" });
    }
    //Start Update
    let query = `UPDATE admins SET ? WHERE id = ${id}`;
    dataBase.query(query, [bodyData], (error, data) => {
      if (error || !data) {
        return res.json({
          success: false,
          msg: "Failed update information",
          error,
        });
      }
      res.json({
        success: true,
        msg: "Great, the data have been successfully updated.",
      });
    });
  });
};

let addAdmin = (req, res) => {
  let email = req.body.email;
  let password = req.body.password;

  /*
    step 1 : check validator(email and password>8)
        step 2 : check Email not exists admins
            step 2.1 : Hash password
                     step 2.1.A : Insert in DB
                        step 2.1.B Send Email
    */
  // Handel Validator Erorrs
  const formError = validationResult(req);
  if (!formError.isEmpty()) {
    let setError = formError.errors[0].msg;
    return res.json({ success: false, msg: setError });
  }

  //step 2 : check Email not exists admins
  let query = `SELECT EXISTS (SELECT email FROM admins WHERE email = ?) AS foundGuardian`;
  dataBase.query(query, [email], (error, results) => {
    if (error) throw error;
    //If Exist as Guardian Before
    if (results[0].foundGuardian) {
      return res.json({
        success: false,
        msg: "This account already exists as Admin",
      });
    }
    //step 2.1 : Hash password
    bcrypt.genSalt(10, (err, salt) => {
      if (err) throw err;
      bcrypt.hash(password, salt, null, (err, hash) => {
        if (err) throw err;
        if (hash) {
          req.body.password = hash;
          //step 2.1.A : Insert in DB [Store]
          let query = `INSERT INTO admins SET ? `;
          dataBase.query(query, req.body, (error, results) => {
            if (error || !results) {
              return res.json({
                success: false,
                msg: "Add admin process has failed!",
              });
            }
            /*
                        //Config  Email
                        configEmail = {
                            to : email,
                            subject : 'Welcome to the control panel of waraqa!',
                            html:`
                                <p>Assalamu alaykum,</p>
                                <p>Congratulations, you have been added to the Waraka platform as an administrator. Please join <a href="" target="_blank">HERE</a> and theses your login information:</p>
                                <p>Email: </p>
                                <p>Password: </p>
                                <p>Best regards</p>
                                `
                        }

                        //Send Email
                        sendEmail(configEmail);
                        */

            return res.json({
              success: true,
              msg: "New admin added successfully",
            });
          });
        }
      });
    });

    // return res.send({ success: true, data: results, msg: 'New user has been created successfully.' });
  });
};
let changeAdminPassword = (req, res) => {
  // Handel Validator Erorrs
  const formError = validationResult(req);
  if (!formError.isEmpty()) {
    let setError = formError.errors[0].msg;
    return res.json({ success: false, msg: setError });
  }

  //Step1: Check password is correct
  //Step2: Hash password
  //Step3: Change Password (Store)
  let id = req.params.id;
  let password = req.body.password; //Current Password
  let newPassword = req.body.newPassword; //New Password
  //Step1: Check password is correct
  let query = `SELECT * FROM admins WHERE id = ?`;
  dataBase.query(query, id, (error, data) => {
    bcrypt.compare(password, data[0].password, (err, isMatch) => {
      if (!isMatch) {
        return res.json({
          success: false,
          msg: "The current password is an incorrect. Please try again.",
        });
      }
      //Step2: Hash password
      bcrypt.genSalt(10, (err, salt) => {
        if (err) throw err;
        bcrypt.hash(newPassword, salt, null, (err, hash) => {
          if (err) throw err;
          if (hash) {
            newPassword = hash;
            //Step3: Change Password (Store)
            dataBase.query(
              `UPDATE admins SET password = ? WHERE id = ${id}`,
              [newPassword],
              (error, data) => {
                if (!data) {
                  return res.json({
                    success: false,
                    msg: "Failed change password!",
                  });
                }
                res.json({
                  success: true,
                  msg: "Password changed successfully.",
                });
              }
            );
          }
        });
      });
    });
  });
};

module.exports = {
  allGuardians,
  allStudents,
  addStudentInWait,
  allTeachers,
  addClass,
  allClasses,
  classesOfMonth,
  allGuardiansBills,
  allTeachersBills,
  addProcess,
  getExpenses,
  updateAdmin,
  addAdmin,
  changeAdminPassword,
};
