FactoryBot.define do
  factory :reward do
    name "Reward One"
    cost 2000
    img "image string"

    factory :invalid_name do
      name nil
      cost 1000
      img "so much for images"
    end

    factory :invalid_cost do
      name "Reward Three"
      cost nil
      img "omg an image"
    end

    factory :invalid_img do
      name "Reward Four"
      cost 100
      img nil
    end
  end
end
