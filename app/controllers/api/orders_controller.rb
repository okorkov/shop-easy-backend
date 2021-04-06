class Api::OrdersController < ApplicationController

  def create
    if current_user
      if params[:user][:user][:current_order] 
        order = Order.find_by(id: params[:user][:user][:current_order])
        product = Product.find_by(id: params[:data][:id])
        order.products << product
        order.save
        render json: order, include: [:products]
      else
        render json: {error: 'no'}
      end
      # order = Order.new
      # current_user.orders << order
      # order.save
      # render json: current_user,include: [:orders]
      # render json: {params: params}
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

{"data"=>{"id"=>5, "name"=>"Google pixel 6", "description"=>"Google Phone", 
  "price"=>"400.0", "category_id"=>1, "updated_at"=>"2021-03-31T18:08:16.042Z",
   "quantity"=>2,
    "image"=>"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQgjM4yd8yiaVAwCAusSdUFg7lpMFVy-KNSQ&usqp=CAU"}, 
    "user"=>{"logged_in"=>true, "user"=>{"id"=>1, "name"=>"Alex", "email"=>"alex.okorkov@gmail.com",
    "password_digest"=>"$2a$12$VysSzojPS7FlQrijkRY9zurx6Z4t790mX9LvnKbLYCyUZrjoTc2ra", 
    "admin"=>true, "current_order"=>3, "created_at"=>"2021-03-30T18:51:11.927Z",
     "updated_at"=>"2021-04-06T16:28:12.182Z"}, "currentCart"=>{"id"=>nil, "items"=>[]}},
    "controller"=>"api/orders", "action"=>"create", "order"=>{}}