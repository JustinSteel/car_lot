# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Make.destroy_all
Car.destroy_all


chevy = Make.create!(name:"chevy", year:1905, american:true)
ford = Make.create!(name:"Ford", year:1888, american:true)

chevy.cars.create!(name:"spark", engine:4, new:true)