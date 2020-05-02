# frozen_string_literal: true

class Suppliers::RegistrationsController < Devise::RegistrationsController
  protected

  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  private

  def sign_up_params
    params.require(:supplier).permit(:cnpj, :phone, :company_name, :photo, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:supplier).permit(:cnpj, :phone, :company_name, :photo, :email, :password, :password_confirmation)
  end
end
