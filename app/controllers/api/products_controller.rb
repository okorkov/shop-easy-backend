class Api::ProductsController < ApplicationController

  def index
    render json: Product.all.order('RANDOM()').first(50), except: [:created_at]
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product, except: [:created_at, :category_id], include: [:category => {only: [:name, :id]}]
  end

end






