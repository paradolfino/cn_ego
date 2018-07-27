require "rails_helper"

RSpec.describe ParticipantsController, type: :controller do
  context "POST #import" do

    # it "redirects to the home page" do
    #   get :import
    #   expect(response).to redirect_to participants_path
    # end

    it "redirects to the home page after post" do
      allow(Participant).to receive(:import).with("foo.csv")
      post :import, params: {file: "foo.csv"}
      expect(response).to redirect_to participants_path
    end

    it "adds a flash notice" do
      allow(Participant).to receive(:import).with("foo.csv")
      post :import, params: {file: "foo.csv"}
      expect(flash[:notice]).not_to be_nil
    end

    it "imports the csv file" do
      expect(Participant).to receive(:import).with("foo.csv")
      post :import, params: {file: "foo.csv"}
    end
  end

end