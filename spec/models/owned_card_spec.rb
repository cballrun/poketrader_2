require 'rails_helper'

RSpec.describe OwnedCard, vcr: { record: :new_episodes }  do
  describe 'relationships' do
    it { should belong_to(:user) } 

  end

  describe 'validations' do
    it { should validate_presence_of(:card_id) }
    #it { should validate_presence_of(:image) }
    it { should validate_presence_of(:condition) }
    it { should define_enum_for(:condition).with_values([:NM, :LP, :MP, :HP, :DMG]) }
    it { should validate_presence_of(:language) }
  end

  describe '#match_to_called_card' do
    
    it 'matches an owned card with the correct card info from API' do
      
      card = CardFacade.card_by_id("base1-44")
      user = create(:user)
      owned_card = create(:owned_card, user: user, card_id: "#{card.card_id}")
      owned_card_2 = create(:owned_card, card_id: "#{card.card_id}")
      owned_card_3 = create(:owned_card, card_id: "neo4-6")
      user_owned_card = owned_card.match_to_called_card(card.card_id)

      expect(user_owned_card.count).to eq(1)
      expect(user_owned_card.first.user).to eq(user)
      expect(user_owned_card.first.card_id).to eq(card.card_id)
      expect(user_owned_card.first.user).to_not eq(owned_card_2.user)
    end
  end
end