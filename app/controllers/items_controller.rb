class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def edit
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to items_url
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :photo, :category)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
