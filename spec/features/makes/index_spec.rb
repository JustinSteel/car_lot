require 'rails_helper'

RSpec.describe "/makes", type: :feature  do

  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system
  describe "When I visit '/makes'" do
    it "Then I see the name of each make record in the system" do
      chevy = Make.create!(name:"Chevy", year:1905, american:true)
      ford = Make.create!(name:"Ford", year:1888, american:true)

      visit "/makes"

      expect(page).to have_content(chevy.name)
      expect(page).to have_content(ford.name)
    end
  end

#   As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
  describe "When I visit '/makes/:make_id/cars'" do
    it "Then I see each car that is associated with that make with each car's attributes" do
      chevy = Make.create!(name:"Chevy", year:1905, american:true)
      ford = Make.create!(name:"Ford", year:1888, american:true)

      spark = chevy.cars.create!(name:"Spark", engine:4, new:true)
      corvette = chevy.cars.create!(name:"Corvette", engine:8, new:true)
      mustang = ford.cars.create!(name:"Mustang", engine:8, new:false)

      visit "/makes/#{chevy.id}/cars"
      
      expect(page).to have_content(spark.name)
      expect(page).to have_content(corvette.name)
      expect(page).to have_content(spark.engine)
      expect(page).to have_content(corvette.engine)
    end
  end

#   As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created
  describe "When I visit the make index" do
    it "I see that records are ordered by most recently created first" do
      chevy = Make.create!(name:"Chevy", year:1905, american:true)
      ford = Make.create!(name:"Ford", year:1888, american:true)
      suzuki = Make.create!(name:"Suzuki", year:1909, american:false)

      visit "/makes"

      expect(chevy.name).to appear_before(ford.name)
      expect(suzuki.name).to_not appear_before(ford.name)
    end

    it "And next to each of the records I see when it was created" do
      suzuki = Make.create!(name:"Suzuki", year:1909, american:false)
      chevy = Make.create!(name:"Chevy", year:1905, american:true)
      ford = Make.create!(name:"Ford", year:1888, american:true)

      visit "/makes"

      expect(page).to have_content(chevy.created_at)
      expect(page).to have_content(ford.created_at)
      expect(page).to have_content(suzuki.created_at)
    end
  end

#   As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index
  describe "When I visit any page on the site" do
    it "Then I see a link at the top of the page that takes me to the Child Index" do

      visit "/makes"

      click_on "Car Index"
      expect(current_path).to eq("/cars")
    end
  end

#   As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
  describe "Make creation" do
    it 'links to the new page for the makes index' do
      # arrange
      # act
      visit '/makes'

      click_link('New Make')
      # assert
      expect(current_path).to eq("/makes/new")
    end

    it 'can create a new make' do
      # arrange
      chevy = Make.create!(name:"Chevy", year:1905, american:true)
      ford = Make.create!(name:"Ford", year:1888, american:true)
      suzuki = Make.create!(name:"Suzuki", year:1909, american:false)

      # act
      visit '/makes'

      click_link('New Make')

      fill_in('make[name]', with: 'Toyota')
      fill_in('make[year]', with: 1937)
      fill_in('make[american]', with: false)

      click_button('Create Make')
      # assert
      expect(current_path).to eq("/makes")
      expect(page).to have_content('Toyota')
    end
  end

end