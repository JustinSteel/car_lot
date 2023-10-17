# As a visitor
# When I visit a Parent Children Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

require 'rails_helper'

RSpec.describe "create car with a make" do
  describe "when I visit make_cars index page" do
    it "I see a link to add a new car for that make" do
      chevy = Make.create!(name: "Chevrolet", year: 1911, american: true)


      visit "/makes/#{chevy.id}/cars"
      expect(current_path).to eq("/makes/#{chevy.id}/cars")
      expect(page).to have_link("Create Car")

      
      click_link "Create Car"
      expect(current_path).to eq("/makes/#{chevy.id}/cars/new")

      fill_in("Name", with: "Reaper")
      fill_in("Engine", with: "8")
      select(false, from: "New")
      # save_and_open_page
      click_button "Create Car"
      expect(current_path).to eq("/makes/#{chevy.id}/cars")
      expect(page).to have_content("Reaper")

    end
  end
end