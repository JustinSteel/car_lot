class MakeCarsController < ApplicationController
  def index
    @make = Make.find(params[:make_id])
    @cars = @make.cars
  end
end