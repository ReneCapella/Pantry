class Order < ApplicationRecord
  belongs_to :store
  has_many :food_items
end
