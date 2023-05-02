require 'rails_helper'

RSpec.describe OwnedCard, type: :model do
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
end