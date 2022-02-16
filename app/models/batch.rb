class Batch < ApplicationRecord
  belongs_to :producer
  belongs_to :store
  has_many :food_items
end
