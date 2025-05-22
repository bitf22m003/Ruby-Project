class Car < ApplicationRecord
    has_many :bookings
    has_one_attached :image
end
