class CarsController < ApplicationController

  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  def edit
    @makes = Make.all
    @car = Car.find(params[:id])
  end

  def update
    car = Car.find(params[:id])
    car.update(car_params)

    redirect_to car_show_path(car)
  end

  private 
  def car_params
    params.permit(:name, :engine, :new, :make_id)
  end
end