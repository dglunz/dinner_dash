class OrdersController < ApplicationController
  before_action :current_user
  before_action :require_admin, only: [:index]

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    if current_user
      @order = Order.new
      @cart_items = @cart.items
    else
      flash[:notice] = 'You need to be logged in to checkout.'
      redirect_to login_path
    end
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.user = @current_user
    @order.pending = true
    @order.items = @cart.order_items
    if @order.save
      flash[:notice] = 'Order created'
      session[:cart] = nil
      redirect_to order_path(@order)
    else
      flash[:notice] = 'Order could not be created. Try checking out again.'
      redirect_to cart_items_path
    end
  end

  def order_params
    params.require(:order).permit(:delivery, :user)
  end
end
