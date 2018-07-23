FactoryBot.define do
  factory :user do
    email "test@test.com"
    password "test"
    
    factory :invalid_email do
       email nil
       password "test"
    end
    
    factory :invalid_password do
       email "test@test.com"
       password nil
    end
  end
end
