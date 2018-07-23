require 'rails_helper'

RSpec.describe ParticipantsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #import" do
    it "returns http success" do
      post :import
      expect(response).to have_http_status(:success)
    end
  end

end
