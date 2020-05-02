class Api::V1::AddressesController < ApplicationController
  before_action :set_address, only: [:update, :destroy]

  def index
    @addresses = (current_client.present?) ? current_client.addresses : current_supplier.addresses
  end

  def create
    @address = Address.new(address_params)
    
  	head :ok if @address.save
  end

  def update
  	head :ok if @address.update(address_params)
  end

  def destroy
  	head :ok if @address.destroy
  end

  private

  def set_address
  	@address  = Address.find(params[:id])
  end

  def address_params
  	params.require(:address).permit(:person_type, :person_id, :cep, :street, :complement, :neighborhood)
  end
end
