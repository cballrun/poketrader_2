class OwnedCard < ApplicationRecord
  belongs_to :user
  has_one_attached :condition_image
  enum condition: [:NM, :LP, :MP, :HP, :DMG]
  
  validates_presence_of :card_id
  validates_presence_of :condition, inclusion: [:NM, :LP, :MP, :HP, :DMG]
  validates_presence_of :language

  def match_to_called_card(card_id)
    owned_cards = []
    user.owned_cards.each do |owned_card|
      if owned_card.card_id == card_id
        owned_cards << owned_card
      end
    end
    owned_cards
  end

end