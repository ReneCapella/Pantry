class AddBatchToFoodItems < ActiveRecord::Migration[7.0]
  def change
    add_reference :food_items, :batch, foreign_key: true
  end
end
