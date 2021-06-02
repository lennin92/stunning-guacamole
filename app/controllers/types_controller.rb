class TypesController < ApplicationController

  # GET /items
  def index
    @items = ActivityType.all

    render json: @items
  end

end