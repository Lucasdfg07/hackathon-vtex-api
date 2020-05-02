class Api::V1::CategoriesController < ApplicationController
  before_action :set_category, only: [:destroy]

  def index
    @categories = Category.all
  end

  def create
  	@category = Category.new(category_params)

	  head :ok if @category.save
  end

  def destroy
  	head :ok if @category.destroy
  end

  private

  def set_category
  	@category  = Category.find(params[:id])
  end

  def category_params
  	params.require(:category).permit(:name, :photo)
  end
end
