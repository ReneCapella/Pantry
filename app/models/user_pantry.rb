class UserPantry < ApplicationRecord
  belongs_to :pantry
  belongs_to :user

  before_save :set_primary

  def set_primary
    Pantry.where.not(id: id).user_pantries.each { |p| p.update(primary: false)}
  end
end
