class FoodItem < ApplicationRecord
  belongs_to :pantry, optional: true
  belongs_to :order
  belongs_to :batch

  accepts_nested_attributes_for :batch, :reject_if => :all_blank
  accepts_nested_attributes_for :order
  accepts_nested_attributes_for :pantry


  before_save :set_default_name

  def set_default_name
     self.name = self.batch.item_name
  end
end
