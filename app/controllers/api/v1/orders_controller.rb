class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: [:destroy]

  def index
    @orders = current_user.orders
  end

  def create
    @order = Order.new(order_params)

    head :ok if @order.save
    
    params[:products].each do |product|
      ProductOrder.create(product_id: product.id, order_id: @order.id, quantity: params[:product][:quantity_order])
    end
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
