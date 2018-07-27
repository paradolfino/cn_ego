require "spec_helper"

describe ParticipantsController do
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

  context "test" do

  end
end