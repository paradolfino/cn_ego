require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "GET #new session" do
    it "returns a 200 http status of success" do
      get :new
      expect(response).to have_http_status(:success)
    end

  end

  describe "POST #create session" do
    it "creates a new session" do
      user = create(:user)
      post :create, params: {session: {email: user.email, password: user.password}}
      puts controller.session.inspect
    end
  end

  describe "DELETE #destroy session" do

  end
end