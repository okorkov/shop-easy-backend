class Api::OrdersController < ApplicationController

  def create
    session[:shopping_cart_id] = nil
    
  end

end
