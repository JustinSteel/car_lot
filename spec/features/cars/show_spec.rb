require 'rails_helper'

RSpec.describe "/cars/:id", type: :feature do
#   As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)
  describe "When I visit '/cars/:id'" do
    it "Then I see the car with that id including the car's attributes" do
      chevy = Make.create!(name:"chevy", year:1905, american:true)
      ford = Make.create!(name:"Ford", year:1888, american:true)

      spark = chevy.cars.create!(name:"spark", engine:4, new:true)
      mustang = ford.cars.create!(name:"Mustang", engine:8, new:false)

      visit "/cars/#{spark.id}"
      expect(page).to have_content(spark.name)
      expect(page).to have_content(spark.engine)
      expect(page).to have_content(spark.new)

    end
  end
end