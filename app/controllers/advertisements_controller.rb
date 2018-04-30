class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisment = Advertisment.find(params[:id])
  end

  def new
    @advertisement = Advertisment.new
  end

  def create
    @advertisment = Advertisment.New
    @advertisment.title = params[:advertisment][:title]
    @advertisment.copy = params[:advertisment][:copy]
    @advertisment.price = params[:advertisment][:price]

    if @advertisment.save
      flash[:notice] = "Advertisment Was Saved! "
      redirect_to @advertisment
    else
        flash[:error] = "There was an error saving the advertisment. Try again"
        render :new
    end

  end
end
