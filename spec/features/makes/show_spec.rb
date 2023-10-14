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
end