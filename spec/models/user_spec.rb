require 'rails_helper'

RSpec.describe User, type: :model do
  context User do
    it "should validate presence of email" do
        expect(build(:invalid_email)).to be_invalid
    end
    
    it "should validate presence of password" do
        expect(build(:invalid_password)).to be_invalid
    end
  
  end
  
end
