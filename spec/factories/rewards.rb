FactoryBot.define do
  factory :reward do
    name "Reward One"
    cost 2000
    img "image string"

    factory :invalid_reward_name do
      name nil
      cost 1000
      img "so much for images"
    end

    factory :invalid_reward_cost do
      name "Reward Three"
      cost nil
      img "omg an image"
    end

    factory :invalid_reward_img do
      name "Reward Four"
      cost 100
      img nil
    end

    factory :invalid_reward_number do
      name "Reward Five"
      cost "10"
      img "imager"
    end
  end
end
