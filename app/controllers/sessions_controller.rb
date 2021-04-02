class SessionsController < ApplicationController

  def create
    # raise params.inspect
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: {status: 200, logged_in: true, user: user}
    else
      render json: { errors: ['Invalid username or password'], status: 401}
    end
  end

  def destroy
    reset_session
    render json: {status: 200, message: "Logged out successfully"}
  end

end