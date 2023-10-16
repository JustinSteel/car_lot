require 'rails_helper'

RSpec.describe 'makes edit page' do


#   As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
describe 'has update button' do
  it 'links to the edit page' do
    make = Make.create!(name: 'Honda', year: 1999, american: false)

    visit "/makes/#{make.id}"

    expect(page).to have_content('Honda')

    click_on "Update #{make.name}"

    expect(current_path).to eq("/makes/#{make.id}/edit")
  end

  it 'can edit the make' do
    make = Make.create!(name: 'Hond', year: 1999, american: false)

    visit "/makes/#{make.id}"

    expect(page).to have_content('Hond')

    click_button 'Edit Hond'

    fill_in 'make[Name]', with: 'Honda'
    fill_in 'make[Year]', with: 1999
    click_on 'Update Make'

    expect(current_path).to eq("/makes")
    expect(page).to have_content('Honda')
  end
end

end