class RemovePrimaryFromPantry < ActiveRecord::Migration[7.0]
  def change
    remove_column :pantries, :primary, :boolean, default: false, null: false
    add_column :user_pantries, :primary, :boolean, default: false, null: false
  end
end
