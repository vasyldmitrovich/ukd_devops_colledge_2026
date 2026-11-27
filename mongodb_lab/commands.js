use students_db
db.students.insertOne({ name: "Іван Петренко", group: "КН-21", grade: 90 })
db.students.insertMany([{ name: "Олена Коваль", group: "КН-21", grade: 95 }, { name: "Максим Бондар", group: "КН-22", grade: 78 }, { name: "Софія Мельник", group: "КН-22", grade: 88 }])
db.students.find({ grade: { $gte: 90 } }).pretty()
db.students.updateOne({ name: "Максим Бондар" }, { $set: { grade: 85 } })
db.students.aggregate([{ $group: { _id: "$group", avgGrade: { $avg: "$grade" }, total: { $sum: 1 } } }])
db.students.deleteOne({ name: "Софія Мельник" })
