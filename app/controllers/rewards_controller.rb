class RewardsController < ApplicationController
  def index
    @rewards = Reward.all
  end

  def show
  end

  def new
    @reward = Reward.new
  end
end
