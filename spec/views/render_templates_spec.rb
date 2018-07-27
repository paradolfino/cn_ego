require 'rails_helper'

RSpec.describe ParticipantsController, type: :controller do

  it "renders index template" do

  end

  it "renders new template" do

  end

  it "renders edit template" do

  end

  it "renders show template" do
    participant = create(:participant)
    get :show, params: { id: participant.to_param }

    expect(response).to render_template :show
  end

end
