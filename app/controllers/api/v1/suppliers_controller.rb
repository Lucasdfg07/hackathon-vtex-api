class Api::V1::SuppliersController < ApplicationController
  before_action :set_supplier, only: [:update, :destroy]

  def index
    @suppliers = Supplier.all
  end

  def create
    @supplier = Supplier.new(supplier_params)
    
  	head :ok if @supplier.save
  end

  def update
  	head :ok if @supplier.update(supplier_params)
  end

  def destroy
  	head :ok if @supplier.destroy
  end

  private

  def set_supplier
  	@supplier  = Supplier.find(params[:id])
  end

  def supplier_params
  	params.require(:supplier).permit(:cnpj, :phone, :company_name, :photo, :email, :password)
  end
end
