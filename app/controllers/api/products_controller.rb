class Api::ProductsController < ApplicationController

  def index
    render json: Product.all, except: [:created_at, :updated_at]
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product, except: [:created_at, :updated_at, :category_id], include: [:category => {only: [:name, :id]}]
  end

end