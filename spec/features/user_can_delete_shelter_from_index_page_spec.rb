require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I click Delete Shelter from the index page' do
    it 'it deletes the shelter' do
      shelter1 = Shelter.create(name: 'Xylia\'s Doggo Friends',
                          address: '3734 Ponderosa Court',
                          city: 'Boulder',
                          state: 'CO',
                          zip: '80301')

      shelter3 = Shelter.create(name: 'Zeus\'s Puppy Pals',
                                address: '3734 Cedar Court',
                                city: 'Boulder',
                                state: 'CO',
                                zip: '80301')

      visit '/shelters'

      within "p#delete_#{shelter3.id}" do
        click_link 'Delete'
      end

      expect(current_path).to eq('/shelters')
      expect(page).to have_no_content("Zeus's Puppy Pals")

      within "p#delete_#{shelter1.id}" do
        click_link 'Delete'
      end

      expect(current_path).to eq('/shelters')
      expect(page).to have_no_content("Zeus's Puppy Pals")
    end
  end
end

# User Story 14, Shelter Delete From Shelter Index Page

# As a visitor
# When I visit the shelter index page
# Next to every shelter, I see a link to delete that shelter
# When I click the link
# I am returned to the Shelter Index Page where I no longer see that shelter