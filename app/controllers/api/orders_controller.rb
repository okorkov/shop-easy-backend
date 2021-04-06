class Api::OrdersController < ApplicationController

  def create
    if current_user
      # order = Order.new
      # current_user.orders << order
      # order.save
      # render json: current_user,include: [:orders]
      render json: {params: params}
    else
      # order = Order.new
      # order.save
      # render json: order,include: [:order_items]
      render json: {text: 'NOT current user'}
    end
  end

  def destroy

  end

end