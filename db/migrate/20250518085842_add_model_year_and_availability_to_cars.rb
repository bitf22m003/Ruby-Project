class AddModelYearAndAvailabilityToCars < ActiveRecord::Migration[7.1]
  def change
    add_column :cars, :model_year, :integer
    add_column :cars, :availability, :boolean
  end
end
