require 'rails_helpter'

Rspec.describe 'As a vistior' do
  describe 'When I visit a shelter\'s showpage' do
    it 'I see the shelter\'s name, address, city, state, and zip' do
      shelter1 = Shelter.create(name: 'Pet Palace')

      visit "/shelters/#{shelter1.id}"
    end
  end
end

# User Story 3, Shelter Show

# As a visitor
# When I visit '/shelters/:id'
# Then I see the shelter with that id including the shelter's:
# - name
# - address
# - city
# - state
# - zip