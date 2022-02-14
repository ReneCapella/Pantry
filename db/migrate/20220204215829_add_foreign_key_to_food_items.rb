class AddForeignKeyToFoodItems < ActiveRecord::Migration[7.0]
  def change
    change_table :food_items do |t|
      t.belongs_to :pantry
    end
  end
end
