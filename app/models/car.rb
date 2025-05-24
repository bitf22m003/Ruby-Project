class Car < ApplicationRecord
    has_many :bookings
    has_one_attached :image

  validates :name, presence: true, format: { with: /\A[a-zA-Z0-9\s]+\z/, message: "only allows letters and numbers" }
  validates :brand, presence: true, format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters" }
  validates :model_year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1990, less_than_or_equal_to: Date.current.year }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :availability, inclusion: { in: [true, false] }
end
