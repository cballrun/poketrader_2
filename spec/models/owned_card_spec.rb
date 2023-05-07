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
    user = User.create!(name: 'Prof Oak', email: 'professor@oaklabs.org')
    owned_card = user.owned_cards.create!(card_id: 'base1-44', condition: 1, language: "English")
    
    
    
    expect(pee).to eq(poop)
  end
end