
class CardFacade
  
  def self.card_by_id(card_id)
    card = CardService.get_card_by_id(card_id)
    Card.new(card[:data])
  end

  def self.get_cards_by_name(name)
    cards= CardService.search_cards_by_name(name)
    cards[:data].map do |card|
      Card.new(card)
    end
  end

  def self.get_cards_by_set_name(name)
    cards= CardService.search_cards_by_set_name(name)
    cards[:data].map do |card|
      Card.new(card)
    end
  end

end