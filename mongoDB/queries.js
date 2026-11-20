use students_db
db.students.insertOne({ name: "Ivan", age: 20 })
db.students.insertMany([
  { name: "Olena", age: 19 },
  { name: "Petro", age: 22 },
  { name: "Maria", age: 21 }
])
db.students.find({ age: { $gt: 19 } })
db.students.updateOne({ name: "Ivan" }, { $set: { age: 21 } })
db.students.deleteOne({ name: "Olena" })
db.courses.insertMany([
  { title: "Databases", teacher: { name: "Kovalenko", department: "IT" }, credits: 5, topics: ["SQL", "NoSQL", "MongoDB"] },
  { title: "Networks", teacher: { name: "Shevchuk", department: "IT" }, credits: 4, topics: ["TCP/IP", "Routing"] },
  { title: "Mathematics", teacher: { name: "Bondar", department: "Math" }, credits: 6, topics: ["Algebra", "Statistics"] }
])
db.courses.find({ credits: { $gte: 5 } })
db.courses.find().sort({ credits: -1 })
db.courses.find({ "teacher.department": "IT" })
db.courses.find({ topics: "MongoDB" })
db.courses.find({ "teacher.department": "IT", credits: { $gt: 4 } })
db.students.updateOne({ name: "Ivan" }, { $set: { courses: ["Databases", "Networks"] } })
db.students.find({ courses: "Databases" })
