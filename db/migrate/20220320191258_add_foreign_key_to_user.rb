class AddForeignKeyToUser < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.belongs_to :pantry
    end
  end
end
