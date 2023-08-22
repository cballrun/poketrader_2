require 'rails_helper'

RSpec.describe 'the Card Search Show Page', vcr: { record: :new_episodes }  do
  
  before :each do
    @user_1 = User.create!(email: 'misty@ceruleangym.org', name: 'Misty')
    @card = CardFacade.card_by_id("neo4-6")
  
    visit "/users/#{@user_1.id}/cards/#{@card.card_id}"
  end
    
  describe 'card details section' do
    it 'shows the cards details and picture' do
      expect(page).to have_content("Gengar")

      within("#card_details") do
        expect(page).to have_content("Set:")
        expect(page).to have_content("Series:")
        expect(page).to have_content("Released:")
        expect(page).to have_content("Est. Value:")

      end
      
      within("#card_image") do
        expect(page).to have_content("Image")
      end
    end
  end

  describe 'buttons section' do
    it 'routes the user to add a card to their collection' do
      click_on("Add Dark Gengar To Collection")
      expect(current_path).to eq("/users/#{@user_1.id}/cards/#{@card.card_id}/owned-cards/new")

    end
  end
end