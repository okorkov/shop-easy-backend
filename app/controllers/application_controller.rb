class ApplicationController < ActionController::API

  # include ActionController::Cookies
  
  # skip_before_action :verify_authenticity_token
  # before_action :authorized

  include ActionController::Cookies

    def current_user
        @current_user = User.find_by(id: cookies[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def authorized
        render json: { message: 'Please log in', status: 403 } unless logged_in?
    end

    def current_shopping_cart
      if !cookies[:shopping_cart_id].nil?
        ShoppingCart.find_by(id: cookies[:shopping_cart_id])
      else
        cart = ShoppingCart.new
        cart.save
        cookies[:shopping_cart_id] = cart.id
      end
    end
end
