require 'rails_helper'

RSpec.describe Reward, type: :model do
  context "validations" do
    it "should validate presence of name" do
      expect(build(:invalid_name)).to be_invalid
    end

    it "should validate presence of cost" do
      expect(build(:invalid_cost)).to be_invalid
    end

    it "should validate numericality" do
      expect(build(:invalid_number)).to be_invalid
    end

  end

end
