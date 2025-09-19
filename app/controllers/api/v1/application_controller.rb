module Api
  module V1
    class ApplicationController < ActionController::API
      before_action :authenticate_with_api_key

      private

      def authenticate_with_api_key
        # 1. Tenta pegar a chave do cabeçalho da requisição (ex: 'X-API-KEY')
        api_key_from_header = request.headers["X-Api-Key"]&.strip if request.headers["X-Api-Key"]

        # 2. Compara a chave do cabeçalho com a chave armazenada em .env
        unless api_key_from_header == ENV["API_KEY"]&.strip
          # 3. Se a chave for inválida, retorna um erro 401 Unauthorized
          render json: { error: "Unauthorized: Invalid API key" }, status: :unauthorized
        end
      end
    end
  end
end
