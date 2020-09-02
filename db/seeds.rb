# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create admin
User.create!(username: "Admin User",
             email: "admin@test.test",
             password: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

# create users
30.times do |n|
  username = Faker::Name.unique.name[0..24]
  email = Faker::Internet.unique.email
  password = "password"
  User.create!(username: username, email: email, password: password, activated: true, activated_at: Time.zone.now)
end
