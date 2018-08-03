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

    let(:participant) {create(:participant)}
    let(:valid_attributes) { attributes_for(:participant )}
    let(:invalid_attributes) { attributes_for(:invalid_both)}

    it "creates a new participant" do
      expect{
        post :create, params: {participant: valid_attributes}
      }.to change(Participant, :count).by(1)
    end

    it "redirects on save" do
        post :create, params: {participant: valid_attributes}
        expect(response).to redirect_to(participants_path)
    end

    it "renders a flash message on save" do
        post :create, params: {participant: valid_attributes}
        expect(flash[:notice]).to be_present
    end

    it "renders a flash message on failure to save" do
      post :create, params: {participant: invalid_attributes}
      expect(flash[:alert]).to be_present
    end

    it "fails to create a new participant" do

      expect(build(:invalid_both)).to be_invalid

    end

    it "redirects to new template on failure to save new participant" do
      post :create, params: {participant: invalid_attributes}
      expect(response).to redirect_to(new_participant_path)
    end

  end

  describe "POST #update" do

    let(:participant) {create(:participant)}
    let(:valid_attributes) { attributes_for(:participant )}
    let(:new_attributes) { attributes_for(:updated_participant)}
    let(:invalid_attributes) { attributes_for(:invalid_both)}

    it "updates a participant" do
        patch :update, params: {id: participant.to_param,participant: new_attributes}
        participant.reload
        expect(participant.name).to eq("test2")
        expect(participant.points).to eq(800)
    end

    it "redirects on update" do
      patch :update, params: {id: participant.to_param,participant: new_attributes}
      expect(response).to redirect_to(participants_path)
    end

    it "renders a flash message on update" do
      patch :update, params: {id: participant.to_param,participant: new_attributes}
      expect(flash[:notice]).to be_present
    end

    it "renders a flash message on failure to update" do
      patch :update, params: {id: participant.to_param,participant: invalid_attributes}
      expect(flash[:alert]).to be_present
    end

    it "fails to update participant" do

      expect(build(:invalid_both)).to be_invalid

    end

    it "redirects to edit template on failure to update participant" do
      patch :update, params: {id: participant.to_param,participant: invalid_attributes}
      expect(response).to redirect_to(edit_participant_path(participant))
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

  describe "INC" do
    let(:participant) {create(:participant)}
    it "increases points for participant" do
      expect{ participant.increment!(:points, by=10) }.to change(participant, :points).by(10)
    end
    it "renders a flash message on increment" do
      get :inc, params: { id: participant.to_param, amount: 10 }
      expect(flash[:notice]).to be_present
    end
  end



end
