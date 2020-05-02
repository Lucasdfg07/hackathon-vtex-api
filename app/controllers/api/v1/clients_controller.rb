class Api::V1::ClientsController < ApplicationController
  before_action :set_client, only: [:update, :destroy]

  def index
    @clients = Client.all
  end

  def create
    @client = Client.new(client_params)
    
  	head :ok if @client.save
  end

  def update
  	head :ok if @client.update(client_params)
  end

  def destroy
  	head :ok if @client.destroy
  end

  private

  def set_client
  	@client  = Client.find(params[:id])
  end

  def client_params
  	params.require(:client).permit(:name, :phone, :photo, :email, :password)
  end
end
