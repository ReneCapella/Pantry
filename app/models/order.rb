class Order < ApplicationRecord
  belongs_to :store
  has_many :food_items

  accepts_nested_attributes_for :food_items
end
