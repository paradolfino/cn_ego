class Reward < ApplicationRecord

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 30 }
  validates :cost, presence: true
  validates :img, presence: true
  validates_numericality_of :cost, only_integer: true

end
