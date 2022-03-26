class Producer < ApplicationRecord
  has_many :batches
  has_one :producer_user, required: false, dependent: :destroy, class_name: "ProducerUser"
  has_one :user

  after_save :create_producer_user

  def create_producer_user
    ProducerUser.create!(producer_id: self.id, user_id: self.user_id)
  end
end
