class DropUserPantry < ActiveRecord::Migration[7.0]
  def change
    drop_table :user_pantries
  end
end
