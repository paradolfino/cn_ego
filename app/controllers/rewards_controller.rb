class RewardsController < ApplicationController
  before_action :set_reward, only: [:show, :edit, :update, :destroy]
  # before_action :authenticate_user, except: [:index]
  def index
    @rewards = Reward.all
  end

  def show
  end

  def new
    @reward = Reward.new
  end

  def create
    @reward = Reward.new(reward_params)
    if @reward.save
      flash[:notice] = "New reward has been created!"
      redirect_to rewards_path
    else
      @errors = errors?(@reward)

      flash[:alert] = "Please correct the following errors: #{@errors.join(". ")}"
      redirect_to new_reward_path
    end
  end

  def edit

  end

  def update
    if @reward.update(reward_params)
      flash[:notice] = "Reward has been updated!"
      redirect_to rewards_path
    else
      @errors = errors?(@reward)
      flash[:alert] = "Please correct the following errors: #{@errors.join(". ")}"
      redirect_to edit_reward_path(@reward)
    end
  end

  private

    def reward_params
      params.require(:reward).permit(:name, :cost, :img)
    end

    def set_reward
      @reward = Reward.find(params[:id])
    end

end
