class AddPickupAndDropOffToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :pickup_location, :string
    add_column :bookings, :dropoff_location, :string
  end
end
