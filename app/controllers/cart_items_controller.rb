class CartItemsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item)
    session[:cart] = @cart.data
    flash[:notice] = "You now have #{pluralize(@cart.count_of(item), item.title)} in your cart."
    redirect_to items_path
  end

  def index
    @cart_items = @cart.items
  end
end