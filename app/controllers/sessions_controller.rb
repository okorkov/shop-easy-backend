class SessionsController < ApplicationController
  def create
    render json: {message: 'went thru'}
  end
end