# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# create admin
User.create!(username: "Demo Account",
             email: "demo@test.test",
             password: "foobar",
             activated: true,
             activated_at: Time.zone.now)

# create users
30.times do |n|
  username = Faker::Name.unique.name[0..24]
  email = Faker::Internet.unique.email
  password = "password"
  User.create!(username: username, email: email, password: password, activated: true, activated_at: Time.zone.now)
end

users = User.order(:created_at).take(6)

users.each do |user|
  rand(10).times do
    name = Faker::Educator.unique.subject[0..24]
    user.categories.create!(name: name, priority: rand(3))
  end
  rand(30).times do
    name = Faker::Lorem.sentence(word_count: rand(1..7))[0..99]
    deadline = Faker::Date.between(from: 10.days.ago, to: "2021-09-25")
    completed = Faker::Boolean.boolean(true_ratio: 0.1)
    category_ids = user.categories.ids.sample(rand(4))
    user.tasks.create!(name: name, priority: rand(3), deadline: deadline, completed: completed, category_ids: category_ids)
  end
  Faker::Educator.unique.clear
end
