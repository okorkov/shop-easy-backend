class Api::CartsController < ApplicationController

  def create
    product = Product.find_by(id: params[:data][:id])
    shopItem = ShoppingCartItem.create(ship_item_params(product))
    shopItem.product = product
    shopItem.save
    render json:  shopItem, include: [:product, :shopping_cart]
  end

  def destroy

  end

  private 

  def ship_item_params(product)
    {quantity: 1, product_id: product.id, shopping_cart_id: current_shopping_cart.id, unit_price: product.price, name: product.name, image: product.image}
  end

end

# t.integer "quantity"
# t.integer "product_id"
# t.integer "shopping_cart_id"
# t.decimal "total", precision: 10, scale: 2
# t.decimal "unit_price", precision: 10, scale: 2
  params = {"data"=>
    {"id"=>1, "name"=>"Iphone 11 pro", "description"=>"Apples products bhal blah 3 cameras blah blah...", "price"=>"999.99", "category_id"=>1, "updated_at"=>"2021-03-31T18:00:00.991Z", "quantity"=>10, "image"=>"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4IUypKEvG1vaD0CLQQ5CpLDEXlQSQcvfc5Q&usqp=CAU"},
    "user"=>{"logged_in"=>true, "user"=>{"id"=>1, "name"=>"Alex", "email"=>"alex.okorkov@gmail.com", "password_digest"=>"[FILTERED]", "admin"=>true, "current_order"=>3, "created_at"=>"2021-03-30T18:51:11.927Z", "updated_at"=>"2021-04-06T16:28:12.182Z"}, 
    "currentCart"=>{"id"=>9, "total"=>nil, "subtotal"=>nil, "created_at"=>"2021-04-06T19:41:10.099Z", "updated_at"=>"2021-04-06T19:41:10.099Z"}, 
    "currentItems"=>[]}, 
    "cart"=>{"data"=>{"id"=>1, "name"=>"Iphone 11 pro", "description"=>"Apples products bhal blah 3 cameras blah blah...", "price"=>"999.99", "category_id"=>1, "updated_at"=>"2021-03-31T18:00:00.991Z", "quantity"=>10, "image"=>"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ4IUypKEvG1vaD0CLQQ5CpLDEXlQSQcvfc5Q&usqp=CAU"},
     "user"=>{"logged_in"=>true, "user"=>{"id"=>1, "name"=>"Alex", "email"=>"alex.okorkov@gmail.com", "password_digest"=>"[FILTERED]", "admin"=>true, "current_order"=>3, "created_at"=>"2021-03-30T18:51:11.927Z", "updated_at"=>"2021-04-06T16:28:12.182Z"}, 
     "currentCart"=>{"id"=>9, "total"=>nil, "subtotal"=>nil, "created_at"=>"2021-04-06T19:41:10.099Z", "updated_at"=>"2021-04-06T19:41:10.099Z"}, 
     "currentItems"=>[]}}}
