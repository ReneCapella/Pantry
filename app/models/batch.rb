class Batch < ApplicationRecord
  belongs_to :producer
  has_many :food_items
end
