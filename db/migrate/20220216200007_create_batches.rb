class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.references :producer, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.string :item_name
      t.datetime :best_by
      t.datetime :exp_date
      t.boolean :recall

      t.timestamps
    end
  end
end
