class CreateUserPantries < ActiveRecord::Migration[7.0]
  def change
    create_table :pantries do |t|
      t.timestamps
    end

    create_table :user_pantries do |t|
      t.belongs_to :pantry
      t.belongs_to :user
      t.timestamps
    end
  end
end
