require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I do someth' do
    it 'it has this outcome' do

    end
  end
end

# User Story 6, Shelter Delete

# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page where I no longer see this shelter