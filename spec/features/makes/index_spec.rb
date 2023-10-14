require 'rails_helper'

RSpec.describe "/makes", type: :feature  do

  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  describe "When I visit '/makes'" do
    it "Then I see the name of each make record in the system" do
      chevy = Make.create!(name:"chevy", year:1905, american:true)
      ford = Make.create!(name:"Ford", year:1888, american:true)

      visit "/makes"

      expect(page).to have_content(chevy.name)
      expect(page).to have_content(ford.name)
    end
  end
end