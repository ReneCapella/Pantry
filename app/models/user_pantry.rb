class UserPantry < ApplicationRecord
  belongs_to :pantry
  belongs_to :user

  before_save :set_primary

  def set_primary
    pantries = Pantry.where.not(id: id)
    pantries.each {|p| p.user_pantries.each { |up| up.update(primary: false)}}
  end
end
