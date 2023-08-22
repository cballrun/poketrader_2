require 'faker'

conditions = [0, 1, 2, 3, 4]
languages = ["English", "Japanese"]

FactoryBot.define do
  factory :owned_card do
    card_id  { "set card id dummy" }
    condition { conditions.sample }
    language { languages.sample }
    user
  end
end