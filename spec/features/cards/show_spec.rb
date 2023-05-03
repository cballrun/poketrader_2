require 'rails_helper'

RSpec.describe 'the Card Search Show Page', vcr: { record: :new_episodes }  do
  
  before :each do
    @user_1 = User.create!(email: 'misty@ceruleangym.org', name: 'Misty')
    @card = CardFacade.card_by_id("neo4-6")
  
    visit "/users/#{@user_1.id}/cards/#{@card.card_id}"
  end
    
  describe 'card details section' do
    it 'shows the cards details' do
      expect(page).to have_content("Gengar")
      within("#card_details") do
        expect(page).to have_content("Set:")
        expect(page).to have_content("Series:")
        expect(page).to have_content("Released:")
        expect(page).to have_content("Est. Value:")

      end
    end
  end
end