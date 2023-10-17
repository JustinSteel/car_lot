require 'rails_helper'

RSpec.describe "/cars", type: :feature do
#   When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
  
  describe 'When I visit "/cars"' do
    it 'Then I see each car in the system including the cars attributes' do
      chevy = Make.create!(name:"chevy", year:1905, american:true)
      ford = Make.create!(name:"Ford", year:1888, american:true)

      spark = chevy.cars.create!(name:"spark", engine:4, new:true)
      mustang = ford.cars.create!(name:"Mustang", engine:8, new:false)

      visit "/cars"
      
      expect(page).to have_content(spark.name)
      expect(page).to have_content(mustang.name)
    end
  end

#   As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Parent Index
  describe "When I visit any page on the site" do
    it "Then I see a link at the top of the page that takes me to the Parent Index" do
      # arrange

      # act
      visit "/cars"

      # assert
  
      click_on "Make Index"
      expect(current_path).to eq("/makes")
    end
  end

end