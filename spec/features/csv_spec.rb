require "rails_helper"

RSpec.describe ParticipantsController, type: :controller do
  context "POST #import" do

    it "redirects to the home page" do
      allow(Participant).to receive(:import).with("foo.csv")
      post :import, file: "foo.csv"
      expect(response).to redirect_to root_path
    end

    it "adds a flash notice" do
      allow(Participant).to receive(:import).with("foo.txt")
      post :import, file: "foo.csv"
      expect(flash[:notice]).to eq "Participant was successfully imported."
    end

    it "imports the csv file" do
      expect(Participant).to receive(:import).with("foo.csv")
      post :import, file: "foo.csv"
    end
  end

  context "test that controller works" do
    describe "GET #index" do
      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
end