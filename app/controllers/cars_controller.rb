class CarsController < ApplicationController
  def index
  if params[:search].present?
    @cars = Car.where("name ILIKE ? OR brand ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
  else
    @cars = Car.all
  end
end


  def show
    @car = Car.find(params[:id])
  end
end
