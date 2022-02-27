class UserPantry < ApplicationRecord
  belongs_to :pantry
  belongs_to :user
end
