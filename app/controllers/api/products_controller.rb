class Api::ProductsController < ApplicationController

  def index
    render json: Product.all
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product
  end

end