FactoryBot.define do
  factory :participant do
    name "test"
    points 100
    
    factory :invalid_name do
        name nil
        points 100
    end
  
    factory :invalid_points do
        name "test"
        points nil
    end
    
    factory :invalid_both do
        name nil
        points nil
    end
  end
end
