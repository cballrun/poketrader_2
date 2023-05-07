require 'faker'

conditions = [1, 2, 3, 4, 5]
languages = ["English", "Japanese"]

FactoryBot.define do
  factory :owned_card do
    card_id = { "set card id dummy" }
    condition { conditions.sample }
    langauge { languages.sample }
    user
  end
end