class AddReferenceToUserOnOrder < ActiveRecord::Migration[7.0]
  def change
    change_table :orders do |t|
      t.belongs_to :user
    end
  end
end
