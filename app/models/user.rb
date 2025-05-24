class User < ApplicationRecord
  has_many :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters" }
  validates :phone, presence: true, format: { with: /\A\d{11}\z/, message: "must be exactly 11 digits" }
  validates :address, presence: true
  validates :email, format: { with: /\A[^@\s]+@gmail\.com\z/, message: "must be a @gmail.com address" }
end
