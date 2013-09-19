class ItemsController < ApplicationController

  def new
  end

  def create

    @item = Item.new(params[:item])

    if @item.save
      render json: @item
    else
      render json: ['Error']
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def index
    @project = Project.find(params[:project_id])
  end
end
