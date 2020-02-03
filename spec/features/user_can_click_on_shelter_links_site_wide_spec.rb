require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I see a shelter name anywhere on the site' do
    it 'I can click it to access the shelter show page' do
      shelter1 = Shelter.create(name: 'Xylia\'s Doggo Friends',
                                address: '3734 Ponderosa Court',
                                city: 'Boulder',
                                state: 'CO',
                                zip: '80301')

      pet1 = shelter1.pets.create!(image: 'https://image.shutterstock.com/image-photo/brindled-plott-hound-puppy-on-600w-79691980.jpg',
                                   name: 'Xylia',
                                   age: '5',
                                   sex: 'female',
                                   description: 'cool cool',
                                   status: 'adoptable')

      visit '/shelters'
      expect(page).to have_link("#{shelter1.name}")

      visit "/shelters/#{shelter1.id}/pets"
      expect(page).to have_link("#{shelter1.name}")

      visit "/shelters/#{shelter1.id}/edit"
      expect(page).to have_link("#{shelter1.name}")

      visit "/pets"
      expect(page).to have_link("#{shelter1.name}")

      visit "/pets/#{pet1.id}"
      expect(page).to have_link("#{shelter1.name}")
    end
  end
end

# User Story 17, Shelter Links

# As a visitor
# When I click on the name a shelter anywhere on the site
# Then that link takes me to that Shelter's show page