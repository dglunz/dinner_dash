class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = Address.all
  end

  def show
  end

  def new
    @address = Address.new
  end

  def edit
  end

  def create
    @address = Address.new(address_params)
    @address.user = current_user
    if @address.save
      redirect_to @address, notice: 'Address was successfuly created'
    else
      flash.now[:notice] = 'Address could not be created, try again.'
      render :new
    end
  end

  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to @address, notice: 'Address was successfuly updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Address was successfully deleted.' }
    end
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:street_name, :street_number, :city, :state, :zip_code)
  end
end
