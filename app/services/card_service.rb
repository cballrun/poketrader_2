class CardService
  def self.get_card_by_id(card_id)
    response = conn.get("/v2/cards/#{card_id}")
    parse(response.body)
  end

  def self.search_cards_by_name(name) #add in partial search later
    response = conn.get("v2/cards/?q=name:#{name}*")
    parse(response.body)
  end

  def self.search_cards_by_set_name(set)
    response = conn.get("v2/cards/?q=set.name:#{set}") #add in partial search later
    parse(response.body)
  end

  def self.conn
    Faraday.new("https://api.pokemontcg.io")
  end

  def self.parse(response)
    JSON.parse(response, symbolize_names: true)
  end

end