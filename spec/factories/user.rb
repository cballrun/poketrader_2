require 'faker'

FactoryBot.define do
  factory :user do
    name { Faker::Games::Pokemon.name }
    email { Faker::Internet.email }
  end 
end