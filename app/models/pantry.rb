class Pantry < ApplicationRecord
  has_many :users
  has_many :food_items

  scope :not_donated, -> { where("status != donated") }
end
