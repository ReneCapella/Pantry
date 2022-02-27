class FoodItem < ApplicationRecord
  belongs_to :pantry, optional: true
  belongs_to :order
  belongs_to :batch

  before_save :set_default_name

  def set_default_name
     self.name = self.batch.item_name
  end
end
