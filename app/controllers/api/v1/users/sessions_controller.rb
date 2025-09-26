# frozen_string_literal: true

class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json
  def create
    super
  end

  def destroy
    super
  end

  private

  def respond_with(resource, _opt = {})
    @token = request.env["warden-jwt_auth.token"]
    headers["Authorization"] = @token

    render json: {
      status: {
        code: 200, message: "Login efetuado com sucesso.",
        token: @token,
        data: {
          user: UserSerializer.new(resource).serializable_hash[:data][:attributes]
        }
      }
    }, status: :ok
  end

  def respond_to_on_destroy
    if request.headers["Authorization"].present?
      jwt_payload = JWT.decode(request.headers["Authorization"].split.last,
                               Rails.application.credentials.devise_jwt_secret_key!).first
      current_user = User.find(jwt_payload["sub"])
    end

    if current_user
      render json: {
        status: 200,
        message: "Desconectado com sucesso."
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "Não foi possível encontrar este usuário ativo."
      }, status: :unauthorized
    end
  end
end
