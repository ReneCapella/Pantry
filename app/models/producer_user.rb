class ProducerUser < ApplicationRecord
  belongs_to :producer
  belongs_to :user
end
