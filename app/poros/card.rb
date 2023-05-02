class Card
  attr_reader :card_id,
              :card_name,
              :supertype,
              :rarity,
              :image,
              :release_date,
              :set_name,
              :series_name,
              :market_value



  def initialize(data)
    @card_id = data[:id]
    @card_name = data[:name]
    @supertype = data[:supertype]
    @rarity = data[:rarity]
    @image = data[:images][:small]
    @release_date = data[:set][:releaseDate]
    @set_name = data[:set][:name]
    @series_name = data[:set][:series]
    @market_value = data[:cardmarket][:prices][:averageSellPrice]
  end
end