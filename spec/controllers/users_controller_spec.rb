require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  let(:valid_attributes) do
    { name: 'username', email: 'user@email.com', password: 'password',
      password_confirmation: 'password' }
  end

  let(:invalid_attributes) do
    { name: nil, email: nil, password: nil, password_confirmation: nil }
  end

  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all users as @user' do
      user = User.create! valid_attributes.merge(admin: true)
      get :index, {}, user_id: user.id
      expect(assigns(:users)).to eq([user])
    end
  end

  describe 'GET show' do
    it 'assigns the requested user as @user' do
      user = User.create! valid_attributes
      get :show, { id: user.to_param }, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'GET new' do
    it 'assigns a new user as @user' do
      get :new, {}, valid_session
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested user as @user' do
      user = User.create! valid_attributes
      get :edit, { id: user.to_param }, valid_session
      expect(assigns(:user)).to eq(user)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new User' do
        expect do
          post :create, { user: valid_attributes }, valid_session
        end.to change(User, :count).by(1)
      end

      it 'assigns a newly created user as @user' do
        post :create, { user: valid_attributes }, valid_session
        expect(assigns(:user)).to be_a(User)
        expect(assigns(:user)).to be_persisted
      end

      it 'redirects to the created user' do

        post :create, { user: valid_attributes }, valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved user as @user' do
        post :create, { user: invalid_attributes }, valid_session
        expect(assigns(:user)).to be_a_new(User)
      end

      it "re-renders the 'new' template" do
        post :create, { user: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) do
        { name: 'newusername', email: 'newuser@email.com',
          password: 'newpassword', password_confirmation: 'newpassword' }
      end

      it 'updates the requested user' do
        user = User.create! valid_attributes.merge(admin: true)
        put :update, { id: user.to_param, user: new_attributes }, user_id: user.id
        user.reload
        expect(user.name).to eq('newusername')
        expect(user.email).to eq('newuser@email.com')
      end

      it 'assigns the requested user as @user' do
        user = User.create! valid_attributes
        put :update, { id: user.to_param, user: valid_attributes }, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it 'redirects to the root path' do
        user = User.create! valid_attributes
        put :update, { id: user.to_param, user: valid_attributes }, valid_session
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'with invalid params' do
      it 'assigns the user as @user' do
        user = User.create! valid_attributes
        put :update, { id: user.to_param, user: invalid_attributes }, valid_session
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        user = User.create! valid_attributes.merge(admin: true)
        put :update, { id: user.to_param, user: invalid_attributes }, user_id: user.id
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested user' do
      user = User.create! valid_attributes.merge(admin: true)
      expect do
        delete :destroy, { id: user.to_param }, user_id: user.id
      end.to change(User, :count).by(-1)
    end

    it 'redirects to the root path' do
      user = User.create! valid_attributes
      delete :destroy, { id: user.to_param }, valid_session
      expect(response).to redirect_to(root_path)
    end
  end

end
