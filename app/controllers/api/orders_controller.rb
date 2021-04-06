class Api::OrdersController < ApplicationController

  def create
    if current_user
      order = Order.new
      current_user.orders << order
      order.save
      render json: current_user,include: [:orders]
    else
      order = Order.new
      order.save
      render json: order,include: [:order_items]
    end
  end

  def destroy

  end

end