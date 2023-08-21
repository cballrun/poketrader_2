require 'rails_helper'

RSpec.describe 'the Add Owned CardPage', vcr: { record: :new_episodes } do

  describe 'owned_card creation' do
    it 'has a form to create an owned card' do
      user = create(:user)
      visit "/users/#{user.id}/cards/col1-33/owned-cards/new"
      expect(page).to have_content('Add Call of Legends Snorlax to your collection')
      expect(find('form')).to have_content('Condition')
      expect(find('form')).to have_content('Language')
      expect(find('form')).to have_button('Add Card')  
    end

    context 'given valid data' do
      it 'the form creates an owned card with the correct attributes and user' do
        user = create(:user)
        visit "/users/#{user.id}/cards/col1-33/owned-cards/new"

        fill_in "Condition", with: "MP"
        fill_in "Language", with: "English"

        expect { click_on 'Add Card' }.to change { OwnedCard.count }.by(1)

        card = OwnedCard.last

        expect(card.user.id).to eq(user.id)
        expect(card.card_id).to eq('col1-33')
        expect(card.condition).to eq("MP")
        expect(card.language).to eq("English")
      end
    end
  end
end