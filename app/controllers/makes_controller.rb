class MakesController < ApplicationController
  def index
    @makes = Make.all
  end

  def show
    
    @make = Make.find(params[:id])
  end
end