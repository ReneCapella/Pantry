class CreateFoodItemStatus < ActiveRecord::Migration[7.0]
  def change
    create_table :food_item_statuses do |t|
      t.string :name
      t.timestamps
    end
  end
end
