class Pantry < ApplicationRecord
  has_many :user_pantries
  has_many :users, :through => :user_pantries
  has_many :food_items

  scope :not_donated, -> { where("donated = false") }
end
