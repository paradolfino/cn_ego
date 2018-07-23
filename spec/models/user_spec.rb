require 'rails_helper'

RSpec.describe User, type: :model do
  context User do
    it "should validate presence of email" do
        user = User.new(password: "test").save
        expect(user).to be_invalid
    end
    
    it "should validate presence of password" do
        user = User.new(email: "test@test.com").save
        expect(user).to be_invalid
    end
  
  end
  
end
