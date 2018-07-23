require 'rails_helper'

RSpec.describe User, type: :model do
  context User do
    it "should validate presence of email" do
        expect(build(:invalid_email)).to be_invalid
    end
    
    it "should validate presence of password" do
        expect(build(:invalid_password)).to be_invalid
    end
    
    it "should validate length of password" do
        user = build(:user)
        puts user.password.length
        expect(user.password.length).to be >= 3
    end
    
    it "should validate uniqueness of email" do
        user = create(:user)
        user2 = build(:user)
        expect(user2).to_not be_valid
    end
  
  end
  
end
