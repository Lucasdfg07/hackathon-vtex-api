class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :update, :destroy]

  def index
    @products = Product.all
  end

  def per_category
  	@products = Product.where(category: params[:category_id])
  end

  def show
  end

  def create
    @product = Product.new(product_params)
    
  	head :ok if @product.save
  end

  def update
  	head :ok if @product.update(product_params)
  end

  def destroy
  	head :ok if @product.destroy
  end

  private

  def set_product
  	@product  = Product.find(params[:id])
  end

  def product_params
  	params.require(:product).permit(:buyer_type, :buyer_id, :status, :total)
  end
end
