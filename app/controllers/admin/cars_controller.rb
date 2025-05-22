class Admin::CarsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  before_action :set_car, only: [:edit, :update, :destroy]

  def index
    if params[:search].present?
    @cars = Car.where("name ILIKE ? OR brand ILIKE ?", "%#{params[:search]}%", "%#{params[:search]}%")
  else
    @cars = Car.all
  end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to admin_dashboard_path, notice: 'Car added successfully!'
    else
      render :new
    end
  end

  def edit
    
  end


def update
 
  if @car.update(car_params)
    redirect_to admin_cars_path, notice: 'Car updated successfully.'
  else
    render :edit
  end
end

def view_all
  @cars = Car.all
end


def destroy
    @car.destroy
    redirect_to admin_cars_path, notice: 'Car was successfully deleted.'
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:name, :brand, :price, :model_year, :availability, :image)
  end

  def require_admin
    redirect_to root_path unless current_user.admin?
  end
end
