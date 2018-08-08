
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
      describe "GET #new" do
        it "returns http success" do
          get :new
          expect(response).to have_http_status(:success)
        end

        it "assigns @reward to a new Reward" do
          part = create(:reward)
          get :new, params: {id: part.to_param}
          expect(assigns(:reward)).to be_a_new(Reward)
        end
      end

      describe "POST #create" do

        let(:reward) {create(:reward)}
        let(:valid_attributes) { attributes_for(:reward )}
        let(:invalid_attributes) { attributes_for(:invalid_reward_name)}

        it "creates a new reward" do
          expect{
            post :create, params: {reward: valid_attributes}
          }.to change(Reward, :count).by(1)
        end

        it "redirects on save" do
          post :create, params: {reward: valid_attributes}
          expect(response).to redirect_to(rewards_path)
        end

        it "renders a flash message on save" do
          post :create, params: {reward: valid_attributes}
          expect(flash[:notice]).to be_present
        end

        it "renders a flash message on failure to save" do
          post :create, params: {reward: invalid_attributes}
          expect(flash[:alert]).to be_present
        end

        it "fails to create a new reward" do

          expect(build(:invalid_both)).to be_invalid

        end

        it "redirects to new template on failure to save new reward" do
          post :create, params: {reward: invalid_attributes}
          expect(response).to redirect_to(new_reward_path)
        end

      end

      describe "POST #update" do

        let(:reward) {create(:reward)}
        let(:valid_attributes) { attributes_for(:reward )}
        let(:new_attributes) { attributes_for(:updated_reward)}
        let(:invalid_attributes) { attributes_for(:invalid_reward_name)}

        it "updates a reward" do
          patch :update, params: {id: reward.to_param,reward: new_attributes}
          reward.reload
          expect(reward.name).to eq("Updated Reward")
          expect(reward.img).to eq("Updated Image")
          expect(reward.cost).to eq(800)
        end

        it "redirects on update" do
          patch :update, params: {id: reward.to_param,reward: new_attributes}
          expect(response).to redirect_to(rewards_path)
        end

        it "renders a flash message on update" do
          patch :update, params: {id: reward.to_param,reward: new_attributes}
          expect(flash[:notice]).to be_present
        end

        it "renders a flash message on failure to update" do
          patch :update, params: {id: reward.to_param,reward: invalid_attributes}
          expect(flash[:alert]).to be_present
        end

        it "fails to update reward" do

          expect(build(:invalid_both)).to be_invalid

        end

        it "redirects to edit template on failure to update reward" do
          patch :update, params: {id: reward.to_param,reward: invalid_attributes}
          expect(response).to redirect_to(edit_reward_path(reward))
        end

      end
end
