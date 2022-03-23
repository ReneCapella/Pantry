class AddTransferedColumnToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :transferred, :boolean, default: false, null: false
  end
end
