# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
AdminUser.delete_all
Category.delete_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

Category.find_or_create_by(name: "Clothes")
Category.find_or_create_by(name: "Home & Decor")
Category.find_or_create_by(name: "Tea")
Category.find_or_create_by(name: "British Snacks")
Category.find_or_create_by(name: "Art and Collectibles")
Category.find_or_create_by(name: "Greeting Cards")
Category.find_or_create_by(name: "Others")