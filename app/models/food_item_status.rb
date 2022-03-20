class FoodItemStatus < ApplicationRecord
  has_many :food_items

  def eaten?

  end

  def donated?

  end

  def thrown_out?

  end
end
