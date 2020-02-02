require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  describe "When I click 'Create Pet'" do
    it 'it adds a pet to the current shelter' do
      shelter3 = Shelter.create!(
        name: 'Zeus\'s Puppy Pals',
        address: '3734 Cedar Court',
        city: 'Boulder',
        state: 'CO',
        zip: '80301'
      )

      visit "/shelters/#{shelter3.id}/pets"

      click_link 'Create Pet'

      expect(current_path).to eq("/shelters/#{shelter3.id}/pets/new")

      fill_in 'Image', with: 'https://image.shutterstock.com/image-photo/brindled-plott-hound-puppy-on-600w-79691980.jpg'
      fill_in 'Name', with: 'Zeus'
      fill_in 'Description', with: 'wild'
      fill_in 'Age', with: '3'
      fill_in 'Sex', with: 'male'
      fill_in 'status', with: 'adoptable'

      click_button 'Create Pet'

      expect(current_path).to eq("/shelters/#{shelter3.id}/pets")

      new_pet = Pet.last

      expect(page).to have_css("img[src*='#{new_pet.image}']")
      expect(page).to have_content(new_pet.name)
      expect(page).to have_content(new_pet.description)
      expect(page).to have_content(new_pet.age)
      expect(page).to have_content(new_pet.sex)
      expect(page).to have_content(new_pet.status)
    end
  end
end

# User Story 10, Shelter Pet Creation

# As a visitor
# When I visit a Shelter Pets Index page
# Then I see a link to add a new adoptable pet for that shelter "Create Pet"
# When I click the link
# I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
# When I fill in the form with the pet's:
# - image
# - name
# - description
# - approximate age
# - sex ('female' or 'male')
# And I click the button "Create Pet"
# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed