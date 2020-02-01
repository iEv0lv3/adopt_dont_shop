require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe 'When I visit pets index' do
    it 'it shows each pet in the system' do
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

      visit '/pets'

      expect(page).to have_css("img[src*='#{pet1.image}']")
      expect(page).to have_content(pet1.name)
      expect(page).to have_content(pet1.age)
      expect(page).to have_content(pet1.sex)
      expect(page).to have_content(pet1.description)
      expect(page).to have_content(pet1.adoptable)
      expect(page).to have_content(shelter3.name)
    end
  end
end
