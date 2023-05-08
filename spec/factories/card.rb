require 'faker'
supertypes = ["Pokemon", "Trainer"]

FactoryBot.define do
  factory :card do
    card_id { "set card id dummy" }
    card_name { Faker::Games::Pokemon.name } 
    supertype { supertypes.sample }
    rarity { Faker::Types.rb_string }
    image { "Faker::LoremFlickr.image" }
    release_date { Faker::Date.between(from: '1997-09-23', to: '2023-09-25') }
    set_name { Faker::Games::Pokemon.location }
    series_name { Faker::Games::Pokemon.move }
    market_value { rand(0.01..1236.94 )}
    initialize_with { new(attributes) }
  end
end