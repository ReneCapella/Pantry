class AddReferenceProducerToUser < ActiveRecord::Migration[7.0]


  def change
    create_table :producer_users do |t|
      t.belongs_to :producer
      t.belongs_to :user
      t.timestamps
    end
  end
end
