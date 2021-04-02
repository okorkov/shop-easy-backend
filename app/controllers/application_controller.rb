class ApplicationController < ActionController::API

  skip_before_action :verify_authenticity_token
  before_action :authorized

    def current_user
        @current_user = User.find_by(session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: { message: 'Please log in', status: 403 } unless logged_in?
    end
end
