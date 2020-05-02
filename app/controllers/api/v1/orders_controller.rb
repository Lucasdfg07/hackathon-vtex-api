class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: [:update, :destroy]

  def index
    @orderes = current_user.orders
  end

  def create
    @order = Order.new(order_params)
    
  	head :ok if @order.save
  end

  def update
  	head :ok if @order.update(order_params)
  end

  def destroy
  	head :ok if @order.destroy
  end

  private

  def set_order
  	@order  = Order.find(params[:id])
  end

  def order_params
  	params.require(:order).permit(:buyer_type, :buyer_id, :status, :total)
  end
end
