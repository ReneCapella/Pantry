class AddColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :pantries, :primary, :boolean, default: false, null: false
    add_column :pantries, :pantry_name, :string, default: "my pantry"
  end
end
