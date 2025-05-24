class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  validates :pickup_location, presence: true, length: { minimum: 3 }
  validates :dropoff_location, presence: true, length: { minimum: 3 }
  validates :price, presence: true, numericality: { greater_than: 0 }

  private

  def end_date_after_start_date
    return if start_date.blank? || end_date.blank?

    if end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
