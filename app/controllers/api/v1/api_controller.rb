module Api
  module V1
    class ApiController < ActionController::Base
      protect_from_forgery with: :null_session

      private

      def current_user
        @current_user
      end
    end
  end
end
