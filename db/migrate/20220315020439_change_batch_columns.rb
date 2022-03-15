class ChangeBatchColumns < ActiveRecord::Migration[7.0]
  def change
    change_column_null :batches, :store_id, true
    change_column_default :batches, :recall, false
  end
end
