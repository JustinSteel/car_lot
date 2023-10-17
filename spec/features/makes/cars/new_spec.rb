require 'rails_helper'
# User 13 continued.
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed

RSpec.describe "create car with a make" do
  describe "when i visit the new car page i see a form" do
    it "i can create a new car" do
      
    end
  end
end