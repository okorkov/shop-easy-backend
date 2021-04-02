class UsersController < ApplicationController

  def show
    user = User.find_by(id: params[:id])
    if user 
      render json: user
    else
      render json: {message: 'User not found'}
    end
  end

  def create
    raise params.inspect
  end

  def user_auth
    raise params.inspect
  end

end