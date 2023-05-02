class CardService
  def self.get_card_data(card_id)
    response = conn.get("/v2/cards/#{card_id}")
    parse(response.body)
  end

  def self.conn
    Faraday.new("https://api.pokemontcg.io")
  end

  def self.parse(response)
    JSON.parse(response, symbolize_names: true)
  end

end