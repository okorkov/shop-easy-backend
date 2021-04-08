class Api::OrdersController < ApplicationController

  def create
    session[:shopping_cart_id] = nil
    
    current_items = params['user']['currentItems']
    current_items.each do |item|
      product = Product.find_by(id: item['product_id'])
      product.quantity -= 1
      product.save
    end
  end

end

