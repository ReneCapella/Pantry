class Pantry < ApplicationRecord
  has_many :user_pantries
  has_many :users, :through => :user_pantries
  has_many :food_items
end
