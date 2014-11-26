class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, only: [:index, :update, :destroy]
  before_action :current_user, only: [:show]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User created.'
    else
      flash.now[:notice] = 'User could not be created.'
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit

  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to user_url, notice: 'User was deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :display_name)
  end
end
