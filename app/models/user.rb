class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :pantry, optional: true
  
  has_one :producer_user, required: false
  has_one :producer, :through => :producer_user, required: false


  enum role: { consumer: 0, producer: 2 }
end
