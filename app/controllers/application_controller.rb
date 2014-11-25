class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :require_admin
  before_action :load_cart
  include ActionView::Helpers::TextHelper

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_admin
    unless current_user && current_user.is_admin?
      redirect_to root_path, notice: 'Not authorized.'
    end
  end

  def load_cart
    @cart = Cart.new(session[:cart])
  end
end
