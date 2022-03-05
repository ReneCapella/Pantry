class UserPantry < ApplicationRecord
  belongs_to :pantry
  belongs_to :user

  before_save :set_primary

  private
  def set_primary
    UserPantry.where.not(id: id).update_all(primary: false)
  end
end
