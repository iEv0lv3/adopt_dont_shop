require 'rails_helper'

RSpec.describe 'As a something', type: :feature_or_model do
  describe 'When I do something' do
    it 'it has this outcome' do
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

      pet2 = shelter3.pets.create!(image: 'https://www.shutterstock.com/image-photo/brindled-plott-hound-puppy-on-dock-79691980',
                                   name: 'Zeus',
                                   age: '3',
                                   sex: 'male',
                                   description: 'wild',
                                   adoptable: 'yes')

      
    end
  end
end

# User Story 9, Pet Show

# As a visitor
# When I visit '/pets/:id'
# Then I see the pet with that id including the pet's:
# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status