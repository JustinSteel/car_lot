require 'rails_helper'

RSpec.describe "/makes/:id", type: :feature  do

  
  describe "When I visit '/makes/:id'" do
    it "Then I see the parent with that id including the parent's attributes" do
      # chevy = Make.create!(name:"chevy", year:1905, american:true)
      ford = Make.create!(name:"Ford", year:1888, american:true)

      visit "/makes/#{ford.id}"
      
      expect(page).to have_content(ford.name)
      expect(page).to have_content(ford.year)
      expect(page).to have_content(ford.american)
    end
  end

#   As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent
  describe "When I visit a make's show page" do
    it "I see a count of the number of cars associated with this make" do
      chevy = Make.create!(name:"Chevy", year:1905, american:true)

      spark = chevy.cars.create!(name:"Spark", engine:4, new:true)
      corvette = chevy.cars.create!(name:"Corvette", engine:8, new:true)
      malabu = chevy.cars.create!(name:"Malabu", engine:6, new:false)

      visit "/makes/#{chevy.id}"
      save_and_open_page
      expect(page).to have_content("Number of cars: 3")
    end
  end
end