class Api::V1::ProductOrdersController < ApplicationController
  before_action :set_productOrder, only: [:update, :destroy]

  def index
    @productOrders = ProductOrder.all
  end

  def create
    @productOrder = ProductOrder.new(product_order_params)
    
    head :ok if @productOrder.save
  end

  def update
  	head :ok if @productOrder.update(product_order_params)
  end

  def destroy
  	head :ok if @productOrder.destroy
  end

  private

  def set_productOrder
  	@productOrder  = ProductOrder.find(params[:id])
  end

  def product_order_params
  	params.require(:product_order).permit(:product_id, :order_id, :quantity)
  end
end
