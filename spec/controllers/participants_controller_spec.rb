require 'rails_helper'

RSpec.describe ParticipantsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    it "assigns @participants to Participant.all" do
      part = create(:participant)
      get :index
      expect(assigns(:participants)).to eq([part])
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "assigns @participant to a new Participant" do
      part = create(:participant)
      get :new, params: {id: part.to_param}
      expect(assigns(:participant)).to be_a_new(Participant)
    end
  end

  describe "POST #create" do
    it "creates a new participant" do
      part = Participant.create!(:participant)
      expect
    end

  end

  describe "GET #show" do
    it "returns http success" do
      part = create(:participant)
      get :show, params: {id: part.to_param}
      expect(response).to have_http_status(:success)
    end

    it "assigns @participant to a Participant" do
      part = create(:participant)
      get :show, params: {id: part.to_param}
      expect(assigns(:participant)).to eq(part)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      part = create(:participant)
      get :edit, params: {id: part.to_param}
      expect(response).to have_http_status(:success)
    end
    it "assigns @participant to a Participant" do
      part = create(:participant)
      get :edit, params: {id: part.to_param}
      expect(assigns(:participant)).to eq(part)
    end
  end



end
