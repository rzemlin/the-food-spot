# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(name: 'Ryan', email: 'rzemlin@gmail.com', password: "")
User.create(name: 'Greg', email: 'gzemlin1@gmail.com', password: "")

Cuisine.create(name: "Mexican")
Cuisine.create(name: "Chinese")
Cuisine.create(name: "American")
Cuisine.create(name: "Italian")
Cuisine.create(name: "Seafood")

Restaurant.create(restaurant_name: "Sam's Chowder House")
Restaurant.create(restaurant_name: "San Jose Taqueria")

