class AddNameToPantry < ActiveRecord::Migration[7.0]
  def change
    add_column :pantries, :name, :string, default: "my pantry"
  end
end
