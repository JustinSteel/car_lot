class MakeCarsController < ApplicationController
  def index
    @make = Make.find(params[:make_id])
    @cars = @make.cars
  end

  def create
    make = Make.find(params[:make_id])
    make.cars.create(car_params)

    redirect_to "/makes/#{make.id}/cars"
  end

  private
  def car_params
    params.permit(:name, :engine, :new)
  end
end