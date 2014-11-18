# require 'rails_helper'

# RSpec.describe AddressController, :type => :controller do
#   let(:valid_attributes) {
#     { street_name: "Bad Street", street_number: "8000", city: "Beverly Hills",
#      state: "CA", zip_code: "90210" }
#   }

#   let(:invalid_attributes) {
#     { street_name: nil, street_number: nil, city: nil,
#      state: nil, zip_code: nil }
#   }

#   let(:valid_session) { {} }

#   describe "GET index" do
#     it "assigns all addresses as @addresses" do
#       address = Address.create! valid_attributes
#       get :index, {}, valid_session
#       expect(assigns(:addresses)).to eq([address])
#     end
#   end

#   describe "GET show" do
#     it "assigns the requested address as @" do
#       get :show
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "GET new" do
#     it "returns http success" do
#       get :new
#       expect(response).to have_http_status(:success)
#     end
#   end

#   describe "GET edit" do
#     it "returns http success" do
#       get :edit
#       expect(response).to have_http_status(:success)
#     end
#   end

# end
