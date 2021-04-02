class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      render json: {status: 200, user: user}
    else
      render json: {status: 501, message: user.errors.full_messages}
    end
  end

  private

  def user_params
    params.permit(:email, :name, :password, :password_confirmation)
  end

end