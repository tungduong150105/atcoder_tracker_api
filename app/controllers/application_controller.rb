class ApplicationController < ActionController::API
  attr_reader :current_user

  def authenticate_request!
    header = request.headers["Authorization"]
    header = header.split(" ").last if header
    decoded = JsonWebToken.decode(header)
    @current_user = User.find_by(id: decoded[:user_id]) if decoded

    render json: { error: "Not Authorized" }, status: :unauthorized unless @current_user
  end
end
