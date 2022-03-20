class AddStatusToFoodItem < ActiveRecord::Migration[7.0]
  def change
    change_table :food_items do |t|
      t.belongs_to :food_item_status
    end
  end
end
