class Api::CartItemsController < ApplicationController

  def destroy
    ShoppingCartItem.find_by(id: params[:id]).destroy
  end

end

