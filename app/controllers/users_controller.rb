class UsersController < ApplicationController

  def create
    user = User.new(user_params)
    if user.save
      cookies[:user_id] = user.id
      if !current_shopping_cart
        cart = ShoppingCart.new
        cart.save
      else
        cart = current_shopping_cart
      end
      cookies[:shopping_cart_id] = cart.id
      
      render json: {status: 200, user: user, cart: current_shopping_cart, cart_items: current_shopping_cart.shopping_cart_items}
    else
      render json: {status: 501, message: user.errors.full_messages}
    end
  end

  def logged_in
    if current_user
      render json: {logged_in: true, user: current_user, cart: current_shopping_cart, cart_items: current_shopping_cart.shopping_cart_items}
    else
      render json: {logged_in: false, cart: current_shopping_cart, cart_items: current_shopping_cart.shopping_cart_items}
    end
  end

  private

  def user_params
    params.permit(:email, :name, :password, :password_confirmation)
  end

end

