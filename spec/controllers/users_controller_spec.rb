require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "POST #update" do

    let(:user) {create(:user)}
    let(:valid_attributes) { attributes_for(:user)}
    let(:new_attributes) { attributes_for(:updated_user)}
    let(:invalid_attributes) { attributes_for(:invalid_email)}

    it "updates a user" do
      params = double(:params, password: 'password')
      patch :update, params
      expect(user).to receive(:update).with(params).and_return(true)
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
