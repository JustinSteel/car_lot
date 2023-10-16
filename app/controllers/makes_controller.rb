class MakesController < ApplicationController
  def index
    @makes = Make.all
  end
  
  def new
    @make = Make.new
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

  def edit
    @make = Make.find(params[:id])
  end

  def update
    make = Make.find(params[:id])
    make.update(make_params)

    redirect_to '/makes'
  end

  private
  def make_params
    params.require(:make).permit(:name)
    params.require(:make).permit(:year)
    params.require(:make).permit(:american)
  end
end