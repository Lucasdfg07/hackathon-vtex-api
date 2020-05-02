class Api::V1::CitiesController < ApplicationController
  before_action :set_city, only: [:update, :destroy]

  def index
    @cities = City.all
  end

  def create
    @city = City.new(city_params)
    
  	head :ok if @city.save
  end

  def update
  	head :ok if @city.update(city_params)
  end

  def destroy
  	head :ok if @city.destroy
  end

  private

  def set_city
  	@city  = City.find(params[:id])
  end

  def city_params
  	params.require(:city).permit(:name)
  end
end
