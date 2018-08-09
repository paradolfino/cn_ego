require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns @users to User.all" do
      user = create(:user)
      get :index
      expect(assigns(:users)).to eq([user])
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "assigns @user to a new User" do
      user = create(:user)
      get :new, params: {id: user.to_param}
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "POST #create" do

    let(:user) {create(:user)}
    let(:valid_attributes) { attributes_for(:user)}
    let(:invalid_attributes) { attributes_for(:invalid_user_name)}

    it "creates a new user" do
      expect{
        post :create, params: {user: valid_attributes}
      }.to change(User, :count).by(1)
    end

    it "redirects on save" do
        post :create, params: {user: valid_attributes}
        expect(response).to redirect_to(users_path)
    end

    it "renders a flash message on save" do
        post :create, params: {user: valid_attributes}
        expect(flash[:notice]).to be_present
    end

    it "renders a flash message on failure to save" do
      post :create, params: {user: invalid_attributes}
      expect(flash[:alert]).to be_present
    end

    it "fails to create a new user" do

      expect(build(:invalid_both)).to be_invalid

    end

    it "redirects to new template on failure to save new user" do
      post :create, params: {user: invalid_attributes}
      expect(response).to redirect_to(new_user_path)
    end

  end

  describe "POST #update" do

    let(:user) {create(:user)}
    let(:valid_attributes) { attributes_for(:user)}
    let(:new_attributes) { attributes_for(:updated_user)}
    let(:invalid_attributes) { attributes_for(:invalid_email)}

    it "updates a user" do
        patch :update, params: {id: user.to_param,user: new_attributes}
        user.reload
        expect(user.email).to eq("test2@test2.com")
        expect(user.password).to eq("test2")
    end

    it "redirects on update" do
      patch :update, params: {id: user.to_param,user: new_attributes}
      expect(response).to redirect_to(users_path)
    end

    it "renders a flash message on update" do
      patch :update, params: {id: user.to_param,user: new_attributes}
      expect(flash[:notice]).to be_present
    end

    it "renders a flash message on failure to update" do
      patch :update, params: {id: user.to_param,user: invalid_attributes}
      expect(flash[:alert]).to be_present
    end

    it "fails to update user" do

      expect(build(:invalid_email)).to be_invalid

    end

    it "redirects to edit template on failure to update user" do
      patch :update, params: {id: user.to_param,user: invalid_attributes}
      expect(response).to redirect_to(edit_user_path(user))
    end

  end
  
  describe "GET #edit" do
    it "returns http success" do
      user = create(:user)
      get :edit, params: {id: user.to_param}
      expect(response).to have_http_status(:success)
    end
    it "assigns @user to a User" do
      user = create(:user)
      get :edit, params: {id: user.to_param}
      expect(assigns(:user)).to eq(user)
    end
  end


end
