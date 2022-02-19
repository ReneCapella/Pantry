class FoodItem < ApplicationRecord
  belongs_to :pantry, optional: true
  belongs_to :order
  belongs_to :batch
end
