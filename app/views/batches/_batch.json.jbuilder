json.extract! batch, :id, :producer_id, :store_id, :item_name, :best_by, :exp_date, :recall, :created_at, :updated_at
json.url batch_url(batch, format: :json)
