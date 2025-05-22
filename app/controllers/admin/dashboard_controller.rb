class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
     @total_cars = Car.count
    @total_bookings = Booking.count
    @monthly_revenue = Booking.where(created_at: Time.current.beginning_of_month..Time.current.end_of_month).sum(:price)

    # Chart data: last 6 months
#   bookings_grouped = Booking.group_by_month(:created_at, last: 6, format: "%b %Y").count

#   @booking_chart_data = {
#     labels: bookings_grouped.keys,
#     values: bookings_grouped.values
#  }
  end

  private

  def authorize_admin!
    redirect_to root_path, alert: "Not authorized" unless current_user.admin?
  end
end
