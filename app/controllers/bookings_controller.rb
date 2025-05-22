class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_car

  def new
    @booking = Booking.new
  end

  def create
  @booking = @car.bookings.build(booking_params)
  @booking.user = current_user

  # Calculate number of days and total price
  if @booking.start_date.present? && @booking.end_date.present?
    days = (@booking.end_date - @booking.start_date).to_i + 1
    @booking.price = @car.price * days
  end

  if @booking.save
    redirect_to cars_path, notice: 'Booking successful!'
  else
    render :new
  end
end


  private

  def set_car
    @car = Car.find(params[:car_id])
  end

def booking_params
  params.require(:booking).permit(:start_date, :end_date, :pickup_location, :dropoff_location)
end

end
