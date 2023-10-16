class MakesController < ApplicationController
  def index
    @makes = Make.all
  end
  
  def new
  end

  def show
    @make = Make.find(params[:id])
  end

  def create
    make = Make.new({
      name: params[:make][:name],
      year: params[:make][:year],
      american: params[:make][:american]
    })

    make.save

    redirect_to "/makes"
  end
end