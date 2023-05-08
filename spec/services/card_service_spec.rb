require 'rails_helper'

RSpec.describe CardService do
  describe 'API endpoint' do
    it 'can get the information needed to create a Pokemon card object', vcr: { record: :new_episodes } do
      data_hash = CardService.get_card_by_id('xy1-1')
      card_data = data_hash[:data]
      set_data = card_data[:set]

      expect(card_data).to be_a(Hash)
      
      expect(card_data[:id]).to be_a(String)
      expect(card_data[:name]).to be_a(String)
      expect(card_data[:supertype]).to be_a(String)
      expect(card_data[:subtypes]).to be_a(Array)
      expect(card_data[:images][:small]).to be_a(String)

      expect(set_data).to be_a(Hash)
      expect(set_data[:name]).to be_a(String)
      expect(set_data[:series]).to be_a(String)
      expect(set_data[:total]).to be_a(Integer)
      expect(set_data[:releaseDate]).to be_a(String)      

    end
  end

  describe 'search' do
    it 'can search cards with a cards full name', vcr: { record: :new_episodes } do
      data_hash = CardService.search_cards_by_name("wurmple")
      card_array = data_hash[:data]

      expect(card_array).to be_a(Array)
      expect(card_array.count).to be_a(Integer)
      card_array.each do |card|
        expect(card).to be_a(Hash)
        expect(card[:id]).to be_a(String)
        expect(card[:supertype]).to be_a(String)
        expect(card[:set]).to be_a(Hash)
        expect(card[:set][:name]).to be_a(String)
        expect(card[:set][:series]).to be_a(String)
        expect(card[:set][:images].count).to eq(2)
        expect(card[:images][:small]).to be_a(String)
        expect(card[:cardmarket][:prices][:averageSellPrice]).to be_a(Float)
      end
    end

    it 'can search the cards in a set with a full set name', vcr: { record: :new_episodes } do
      data_hash = CardService.search_cards_by_set_name("expedition")
      card_array = data_hash[:data]
      expect(card_array).to be_a(Array)
      expect(card_array.count).to be_a(Integer)
      
      card_array.each do |card|
        expect(card).to be_a(Hash)
        expect(card[:id]).to be_a(String)
        expect(card[:supertype]).to be_a(String)
        expect(card[:set]).to be_a(Hash)
        expect(card[:set][:name]).to eq("Expedition Base Set")
        expect(card[:set][:series]).to be_a(String)
        expect(card[:set][:images].count).to eq(2)
        expect(card[:images][:small]).to be_a(String)
        expect(card[:cardmarket][:prices][:averageSellPrice]).to be_a(Float)
      end
    end
  end
end