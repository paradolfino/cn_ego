require 'rails_helper'

RSpec.describe ParticipantsController, type: :controller do

  it "renders index template" do
    get :index
    expect(response).to render_template :index
  end

  it "renders new template" do
    get :new
    expect(response).to render_template :new
  end

  it "renders edit template" do
    participant = create(:participant)
    get :edit, params: { id: participant.to_param }

    expect(response).to render_template :edit
  end

  it "renders show template" do
    participant = create(:participant)
    get :show, params: { id: participant.to_param }

    expect(response).to render_template :show
  end

end

RSpec.describe ParticipantsController, type: :controller do

  it "renders index template" do
    get :index
    expect(response).to render_template :index
  end

  it "renders new template" do
    get :new
    expect(response).to render_template :new
  end

  it "renders edit template" do
    participant = create(:participant)
    get :edit, params: { id: participant.to_param }

    expect(response).to render_template :edit
  end

  it "renders show template" do
    participant = create(:participant)
    get :show, params: { id: participant.to_param }

    expect(response).to render_template :show
  end

end

RSpec.describe UsersController, type: :controller do

  it "renders edit template" do
    user = create(:user)
    get :edit, params: { id: user.to_param }

    expect(response).to render_template :edit
  end


end
