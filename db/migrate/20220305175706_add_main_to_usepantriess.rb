class AddMainToUsepantriess < ActiveRecord::Migration[7.0]
  def change
    add_column :user_pantries, :primary, :boolean, default: false, null: false
  end
end
