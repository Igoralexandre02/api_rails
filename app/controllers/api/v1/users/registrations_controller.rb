# frozen_string_literal: true

class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
  before_action :sign_up_params, if: :devise_controller?
  respond_to :json

  def create
    super
  end

  def update
    super
  end

  def destroy
    super
  end

  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      token = request.env["warden-jwt_auth.token"]

      render json: {
        status: 200,
        message: "Inscrito com sucesso.",
        token: token,
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    else
      render json: {
        status: 422,
        errors: resource.errors.full_messages
      }, status: :unprocessable_entity
    end
  end

  protected

  def sign_up_params
    params.require(:user).permit(:email, :cpf, :password, :password_confirmation)
  rescue ActionController::ParameterMissing
    params.require(:registration).require(:user).permit(:email, :cpf, :password, :password_confirmation)
  end
end
