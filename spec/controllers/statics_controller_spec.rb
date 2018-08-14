require 'rails_helper'

RSpec.describe StaticsController, type: :controller do
  it "returns http success" do
    get :home
    expect(response).to have_http_status(:success)
  end
end