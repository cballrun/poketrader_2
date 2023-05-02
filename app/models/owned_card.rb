class OwnedCard < ApplicationRecord
  belongs_to :user
  validates_presence_of :card_id
  validates_presence_of :condition
  validates_presence_of :language

end