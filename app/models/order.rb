class Order < ApplicationRecord
  belongs_to :store
  has_many :food_items

  accepts_nested_attributes_for :food_items

  def transfer_ownership(pantry_id)
    self.food_items.each do |item|
      item.update!(pantry_id: pantry_id, order_id: self.id)
    end
  end
end
