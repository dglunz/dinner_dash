require 'rails_helper'

RSpec.describe OrdersController, :type => :controller do
  let(:valid_attributes) {
    { delivery: true, pending: false }
  }

  let(:invalid_attributes) {
    { delivery: nil, pending: nil }
  }

  let(:valid_session) { {} }

  describe "GET index" do 
    it "assigns all orders as @orders" do 
      order = Order.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:orders)).to eq([order])
    end
  end

end
