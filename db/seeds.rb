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
suzuki = Make.create!(name:"Suzuki", year:1909, american:false)

chevy.cars.create!(name:"spark", engine:4, new:true)
chevy.cars.create!(name:"corvette", engine:8, new:true)
chevy.cars.create!(name:"camaro", engine:8, new:false)
ford.cars.create!(name:"mustang", engine:8, new:false)
ford.cars.create!(name:"fusion", engine:4, new:true)
ford.cars.create!(name:"f-150", engine:8, new:true)
suzuki.cars.create!(name:"swift", engine:4, new:true)
suzuki.cars.create!(name:"vitara", engine:6, new:false)
suzuki.cars.create!(name:"samurai", engine:4, new:false)