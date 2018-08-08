class RewardsController < ApplicationController
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
    else
      @errors = []
      @reward.errors.full_messages.each do |m|
        @errors << m
      end
      flash[:alert] = "Please correct the following errors: #{@errors.join(". ")}"
      redirect_to new_reward_path
    end
  end
end
