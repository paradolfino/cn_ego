require 'rails_helper'

RSpec.describe Reward, type: :model do
  context "validations" do
    it "validates with valid attributes" do
      expect(build(:reward)).to be_valid
    end
    it "should validate presence of name" do
      expect(build(:invalid_reward_name)).to be_invalid
    end

    it "should validate presence of cost" do
      expect(build(:invalid_reward_cost)).to be_invalid
    end

    it "should validate presence of image" do
      expect(build(:invalid_reward_img)).to be_invalid
    end

    it "should validate numericality" do
      expect(build(:invalid_reward_number)).to be_invalid
    end

  end

end
