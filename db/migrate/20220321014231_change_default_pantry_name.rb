class ChangeDefaultPantryName < ActiveRecord::Migration[7.0]
  def change
    change_column_default :pantries, :name, nil
  end
end
