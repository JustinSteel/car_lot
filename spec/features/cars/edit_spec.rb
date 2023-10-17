require 'rails_helper'

RSpec.describe "cars edit", type: :feature do
#   User Story 14, Child Update 

# As a visitor
# When I visit a Child Show page
# Then I see a link to update that Child "Update Child"
# When I click the link
# I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
# When I click the button to submit the form "Update Child"
# Then a `PATCH` request is sent to '/child_table_name/:id',
# the child's data is updated,
# and I am redirected to the Child Show page where I see the Child's updated information
describe 'has update button' do
  it 'links to the edit page' do
    chevy = Make.create!(name:"chevy", year:1905, american:true)

    car = chevy.cars.create!(name:"chevell", engine:8, new:false)
    visit "/cars/#{car.id}"

    expect(page).to have_content('chevell')

    click_on "Update #{car.name}"

    expect(current_path).to eq("/cars/#{car.id}/edit")
  end

  it 'can edit the make' do
    chevy = Make.create!(name:"chevy", year:1905, american:true)

    car = chevy.cars.create!(name:"chevell", engine:8, new:false)
    visit "/cars/#{car.id}"

    expect(page).to have_content('chevell')
    click_link 'Update chevell'
    # save_and_open_page

    fill_in 'Name', with: 'chevelle'
    click_on "Update #{car.name}"
# save_and_open_page
    expect(current_path).to eq(car_show_path(car))
    expect(page).to have_content('chevelle')
  end
end
end