require 'rails_helper'

RSpec.describe AddressesController, :type => :controller do
  let(:valid_attributes) {
    { street_name: "Bad Street", street_number: "8000", city: "Beverly Hills",
     state: "CA", zip_code: "90210" }
  }

  let(:invalid_attributes) {
    { street_name: nil, street_number: nil, city: nil,
     state: nil, zip_code: nil }
  }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all addresses as @addresses" do
      address = Address.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:addresses)).to eq([address])
    end
  end

  describe "GET show" do
    it "assigns the requested person as @person" do
      address = Address.create! valid_attributes
      get :show, {:id => address.to_param}, valid_session
      expect(assigns(:address)).to eq(address)
    end
  end

  describe "GET new" do
    it "assigns a new address as @address" do
      get :new, {}, valid_session
      expect(assigns(:address)).to be_a_new(Address)
    end
  end

  describe "GET edit" do
    it "assigns the requested address as @address" do
      address = Address.create! valid_attributes
      get :edit, {:id => address.to_param}, valid_session
      expect(assigns(:address)).to eq(address)
    end
  end

  describe "POST create" do 
    describe "with valid params" do 
      it "creates a new Address" do
        expect {
          post :create, {:address => valid_attributes}, valid_session
        }.to change(Address, :count).by(1)
      end

      it "assigns a newly created address as @address" do 
        post :create, {:address => valid_attributes}, valid_session
        expect(assigns(:address)).to be_a(Address)
        expect(assigns(:address)).to be_persisted
      end

      it "redirects to the created address" do 
        post :create, {:address => valid_attributes}, valid_session
        expect(response).to redirect_to(Address.last)
      end
    end

    describe "with invalid params" do 
      it "assigns a newly created by unsaved address as @address" do 
        post :create, {:address => invalid_attributes}, valid_session
        expect(assigns(:address)).to be_a_new(Address)
      end

      it "re-renders the 'new' template" do 
        post :create, {:address => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT update" do 
    describe "with valid params" do 
      let(:new_attributes) {
        { street_name: "Good Street", street_number: "7000", city: "Beverly Hills",
         state: "CA", zip_code: "90210", order_id: 5 }
      }

      it "updates the requested address" do 
        address = Address.create! valid_attributes 
        put :update, {:id => address.to_param, :address => new_attributes}, valid_session
        address.reload
        expect(address.street_name).to eq("Good Street")
      end

      it "assigns the requested address as @address" do 
        address = Address.create! valid_attributes
        put :update, {:id => address.to_param, :address => valid_attributes}, valid_session
        expect(assigns(:address)).to eq(address)
      end

      it "redirects to the address" do 
        address = Address.create! valid_attributes
        put :update, {:id => address.to_param, :address => valid_attributes}, valid_session
        expect(response).to redirect_to(address)
      end
    end

    describe "with invalid params" do 
      it "assigns the address as @address" do 
        address = Address.create! valid_attributes
        put :update, {:id => address.to_param, :address => invalid_attributes}, valid_session 
        expect(assigns(:address)).to eq(address)
      end

      it "re-renders the 'edit' template" do 
        address = Address.create! valid_attributes
        put :update, {:id => address.to_param, :address => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

    describe "DELETE destroy" do 
      it "destroys a requested address" do 
        address = Address.create! valid_attributes
        expect {
          delete :destroy, {:id => address.to_param}, valid_session
        }.to change(Address, :count).by(-1)
      end

    end

  end


