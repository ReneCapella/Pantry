class Batch < ApplicationRecord
  belongs_to :producer
  belongs_to :store
end
