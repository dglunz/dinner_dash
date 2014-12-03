class ChargesController < ApplicationController
  def new
    @order = Order.find_by(id: session[:order])
  end

  def create
    @order = Order.find_by(id: session[:order])
    @amount = @order.stripe_total

    customer = Stripe::Customer.create(
      email: current_user.email,
      card: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe Customer',
      currency: 'usd'
    )

    session[:order] = nil
    @order.update_attributes(pending: false)
    redirect_to order_path(@order), notice: "Payment of #{@order.total} accepted"

  rescue Stripe::CardError => e
    flash[:error] = e.message
  end

end
