class User < ApplicationRecord
  has_many :owned_cards

  validates_presence_of :email
  validates_uniqueness_of :email
  validates_presence_of :name
  validates_uniqueness_of :name
end