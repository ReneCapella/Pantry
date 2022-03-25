class FoodItem < ApplicationRecord
  belongs_to :pantry, optional: true
  belongs_to :order
  belongs_to :batch
  belongs_to :food_item_status, optional: true

  accepts_nested_attributes_for :batch, :reject_if => :all_blank
  accepts_nested_attributes_for :order
  accepts_nested_attributes_for :pantry

  scope :active, -> { where(deleted_at: nil) }
  scope :non_active, -> { where.not(deleted_at: nil)}

  before_save :set_default_name

  def set_default_name
    if !self.name
     self.name = self.batch.item_name
    end
  end

  def set_donated
    unless self.batch.exp_date <= DateTime.now
      status = FoodItemStatus.find_by_name('donated')
      self.update(food_item_status_id: status.id)
    end
  end

  def delete
    puts "HERE!"
    self.update(deleted_at: DateTime.now)
    puts self.deleted_at
  end
end
