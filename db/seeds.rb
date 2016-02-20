# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

<Upload id: 16, url: "https://cshub-bucket.s3.amazonaws.com/uploads/EECS...", name: "EECS_3221_W_2016_Smith_midterm_1.pdf2016-02-18T23:...", created_at: "2016-02-19 04:50:43", updated_at: "2016-02-19 04:50:43", subject: "uploads/EECS", course: 3221, instructor: "Smith", year: 2016, term: "W", type_num: 1, type_of: "midterm">

for i in 0..100
  Upload.create!(name: "EECS_3221_W_2016_Smith_midterm_1.pdf2016-02-18T23:50:42-05:00", subject: "uploads/EECS", course: 3221, instructor: "Smith", year: 2016, term: "W", type_num: 1, type_of: "midterm")
  Upload.create!(name: "MATH_1090_F_2015_Smith_midterm_1.pdf2016-02-18T23:50:42-05:00", subject: "uploads/MATH", course: 1090, instructor: "Smith", year: 2015, term: "F", type_num: 1, type_of: "midterm")
end
