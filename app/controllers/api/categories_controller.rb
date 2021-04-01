class Api::CategoriesController < ApplicationController

  def index
    render json: Category.all, only: [:id, :name]
  end

  def show
    category = Category.find_by(id: params[:id])
    render json:  category, only: [:id, :name], include: [:products => {except: [:created_at, :updated_at]}]
  end

end
