class Api::CartsController < ApplicationController

  def create
    product = Product.find_by(id: params[:data][:id])
    shopItem = ShoppingCartItem.create(ship_item_params(product))
    shopItem.product = product
    current_shopping_cart.shopping_cart_items << shopItem
    shopItem.save
    render json:  shopItem, include: [:product, :shopping_cart]
  end

  def destroy

  end

  private 

  def ship_item_params(product)
    {quantity: 1, product_id: product.id, shopping_cart_id: current_shopping_cart, unit_price: product.price, name: product.name, image: product.image}
  end

end

