# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Event.destroy_all
Attendance.destroy_all


10.times do
  user = User.create!(email: Faker::Internet.email, encrypted_password: Faker::Number.number(7), description: Faker::Shakespeare.hamlet_quote, first_name: Faker::HarryPotter.character, last_name: Faker::HarryPotter.character)
end

10.times do
  event = Event.create!(start_date: Faker::Date.forward(5), duration: Faker::Number.number(3), title: Faker::Shakespeare.hamlet_quote, description: Faker::Shakespeare.hamlet_quote, price: Faker::Number.number(2), location: Faker::Address.city, administrator_id: User.all.sample.id)
end

20.times do
  attendance = Attendance.create!(stripe_customer_id: Faker::Cat.name, guest_id: User.all.sample.id, event_id: Event.all.sample.id)
end
