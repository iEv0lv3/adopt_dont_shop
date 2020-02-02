require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit a shelter show page' do
    it 'it has all pets at the shelter listed' do
      shelter3 = Shelter.create!(name: 'Zeus\'s Puppy Pals',
                                 address: '3734 Cedar Court',
                                 city: 'Boulder',
                                 state: 'CO',
                                 zip: '80301')

      pet1 = shelter3.pets.create!(image: 'https://www.shutterstock.com/image-photo/brindled-plott-hound-puppy-on-dock-79691980',
                                   name: 'Xylia',
                                   age: '5',
                                   sex: 'female',
                                   description: 'cool cool',
                                   adoptable: 'yes')

      pet1 = shelter3.pets.create!(image: 'https://www.shutterstock.com/image-photo/brindled-plott-hound-puppy-on-dock-79691980',
                                   name: 'Zeus',
                                   age: '3',
                                   sex: 'male',
                                   description: 'wild',
                                   adoptable: 'yes')

      visit "/shelters/#{shelter3.id}/pets"

      expect(page).to have_css("img[src*='#{pet1.image}']")
      expect(page).to have_content(pet1.name)
      expect(page).to have_content(pet1.age)
      expect(page).to have_content(pet1.sex)
    end
  end
end
