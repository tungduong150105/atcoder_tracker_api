module Api
  module V1
    class SessionsController < ApplicationController
      def create
        user = User.find_by(username: session_params[:username])

        if user && user.authenticate(session_params[:password])
          token = JsonWebToken.encode(user_id: user.id)
          time = 24.hours.from_now

          render json: {
            token: token,
            exp: time,
            username: user.username
          }, status: :ok
        else
          render json: { error: "Invalid username or password" }, status: :unauthorized
        end
      end

      private

      def session_params
        params.expect(session: [ :username, :password ])
      end
    end
  end
end
