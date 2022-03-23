class Order < ApplicationRecord
  belongs_to :store
  belongs_to :user, optional: true
  has_many :food_items

  accepts_nested_attributes_for :food_items

  def transfer_ownership(pantry_id, user_id)
    return false unless transferrable?
    self.food_items.each do |item|
      item.update!(pantry_id: pantry_id, order_id: self.id)
    end
    self.update!(user_id: user_id, transferred: true)

    return true
  end



  private

  def transferrable?
    #has it been transferred alreadY? if true, return false, if false return true
    !self.transferred
  end
end
