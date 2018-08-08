
require 'rails_helper'
RSpec.describe RewardsController, type: :controller do
describe 'GET #index' do
      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end
      it 'assigns @rewards to Reward.all' do
        reward = create(:reward)
        get :index
        expect(assigns(:rewards)).to eq([reward])
      end
    end
describe 'GET #show' do
      it 'returns http success' do
        reward = create(:reward)
        get :show, params: {id: reward.to_param}
        expect(response).to have_http_status(:success)
      end

      it 'assigns @reward to a Reward' do
        reward = create(:reward)
        get :show, params: {id: reward.to_param}
        expect(assigns(:reward)).to eq(reward)
      end
    end
end
