class Store < ApplicationRecord
  has_many :orders
  has_many :batches
end
