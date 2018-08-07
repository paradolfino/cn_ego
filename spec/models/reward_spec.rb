require 'rails_helper'

RSpec.describe Reward, type: :model do
  context Reward do
    it "should validate presence of name" do
      reward = build(:invalid_name)
      expect(reward).to be_invalid
    end

    it "should validate presence of points" do
      reward = build(:invalid_points)
      expect(reward).to be_invalid
    end

    it "should be a number" do
      reward = Reward.create(name: "able", points: 1)
      expect(reward).to be_valid
    end

  end

end
