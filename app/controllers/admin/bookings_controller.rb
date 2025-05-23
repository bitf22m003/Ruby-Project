class Admin::BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin  

  def index
    @bookings = Booking.includes(:user, :car).all
  end

  private

 def check_admin
  unless current_user.admin?
    redirect_to root_path, alert: "You are not authorized to access this page."
  end
 end
end

