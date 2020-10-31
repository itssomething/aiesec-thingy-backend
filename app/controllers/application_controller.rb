class ApplicationController < ActionController::API
  before_action :authenticate

  def authenticate
    if request.headers["Authorization"].present?
      token = request.headers["Authorization"].split(" ").last

      if token != ENV['SECRET_TOKEN']
        render json: { message: "unauthorized" }, status: :unauthorized
      end
    end
  end
end
