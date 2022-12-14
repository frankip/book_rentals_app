require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Book.destroy_all
# Author.destroy_all
# User.destroy_all
Rental.destroy_all

# 10.times{Author.create(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number_with_country_code )}
# 40.times{User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, phone: Faker::PhoneNumber.phone_number_with_country_code)}
# 30.times{Book.create(
#     user = Author.order('RANDOM()').first
#     title: Faker::Book.title, 
#     description: Faker::Lorem.paragraph,
#     author_id:user.id)}
# 30.times{
#     user = Author.order('RANDOM()').first
#     Book.create(
#         title: Faker::Book.title,
#         description: Faker::Lorem.paragraph, 
#         author_id:user.id)
#     }

20.times{
    user = User.order('RANDOM()').first
    book = Book.order('RANDOM()').first
    Rental.create(
        book_id: book.id,
        user_id: user.id,
        days: 5
)}