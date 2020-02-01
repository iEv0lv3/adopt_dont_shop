require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I visit shelters index page' do
    it "Then I see the name of each shelter" do
      shelter1 = Shelter.create(name: 'Pet Palace')

      visit '/shelters'

      expect(page).to have_content(shelter1.name)
    end
  end
end
