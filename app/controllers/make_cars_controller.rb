class MakeCarsController < ApplicationController
  def index
    @makes = Make.find(params[:make_id])
    @cars = @makes.cars
  end
end