class OwnedCard < ApplicationRecord
  belongs_to :user
  enum condition: [:NM, :LP, :MP, :HP, :DMG]
  
  validates_presence_of :card_id
  validates_presence_of :condition, inclusion: [:NM, :LP, :MP, :HP, :DMG]
  validates_presence_of :language

  def match_to_called_card(card_id)
    binding.pry
    OwnedCard.where(card_id: card_id)
  end

end