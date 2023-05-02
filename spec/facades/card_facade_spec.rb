
require 'rails_helper'

RSpec.describe CardFacade do

  describe '#card_by_id' do
    it 'returns a single movie', vcr: { record: :new_episodes } do
      card_id = "base4-1"
      
      card = CardFacade.card_by_id(card_id)
      expect(card).to be_a(Card)
      expect(card.card_id).to be_a(String)
      expect(card.card_name).to be_a(String)
      expect(card.stock_image).to be_a(String)
      expect(card.market_value).to be_a(Float)
      expect(card.rarity).to be_a(String)
      expect(card.series_name).to be_a(String)
      expect(card.set_name).to be_a(String)
      expect(card.supertype).to be_a(String)

    end
  end

end