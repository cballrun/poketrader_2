require 'rails_helper'

RSpec.describe CardService do
  describe 'API endpoint' do
    it 'can get the information needed to create a Pokemon card object', vcr: { record: :new_episodes } do
      data_hash = CardService.get_card_data('xy1-1')
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
end