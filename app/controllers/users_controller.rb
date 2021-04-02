class UsersController < ApplicationController

  def show
    user = User.find_by(id: params[:id])
    user_encoded = encode_token({
      id: user.id,
      name: user.name,
      email: user.email,
      admin: user.admin,
      current_order: user.current_order
    })
    if user 
      render json: {user_token: user_encoded}
    else
      render json: {message: 'User not found'}
    end
  end

  def create
    raise params.inspect
  end

end