class CardFacade
  
  def self.card_by_id(card_id)
    card = CardService.get_card_by_id(card_id)
    Card.new(card[:data])
  end

end