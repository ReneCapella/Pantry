class FoodItem < ApplicationRecord
  belongs_to :pantry
  belongs_to :order
  belongs_to :batch
end
