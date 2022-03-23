class AddDeletedAtToFoodItem < ActiveRecord::Migration[7.0]
  def change
    add_column :food_items, :deleted_at, :date_time, null: true
  end
end
