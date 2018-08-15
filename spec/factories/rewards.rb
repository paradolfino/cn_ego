FactoryBot.define do
  factory :reward do
    name "Reward One"
    cost 2000


    factory :invalid_reward_name do
      name nil
      cost 1000

    end

    factory :invalid_reward_cost do
      name "Reward Three"
      cost nil

    end

    factory :invalid_reward_img do
      name "Reward Four"
      cost 100
      img nil
    end

    factory :invalid_reward_number do
      name "Reward Five"
      cost "abcsd"

    end

    factory :updated_reward do
      name "Updated Reward"
      cost 800

    end

    factory :second_reward do
      name "Second Reward"
      cost 10

    end
  end
end
