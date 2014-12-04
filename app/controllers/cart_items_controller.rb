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

  def plus
    item = Item.find_by(id: params["item"].to_i)
    @cart.add_item(item)
    redirect_to cart_items_path
  end

  def minus
    item = Item.find_by(id: params["item"].to_i)
    @cart.remove_item(item)
    redirect_to cart_items_path
  end
end
