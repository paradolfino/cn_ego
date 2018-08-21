require 'rails_helper'

feature "rewards/index" do
  scenario "it renders a list of rewards" do
    create(:reward)
    create(:second_reward)
    visit rewards_path
    expect(page).to have_content("Reward One")
    expect(page).to have_content("10")
  end

end

feature "rewards/new" do
  scenario "it renders a new reward form" do
    visit rewards_path

    expect{
      click_link 'New'
      fill_in 'reward_name', with: 'Test Reward'
      fill_in 'reward_cost', with: 10
      page.attach_file('reward_img', Rails.root.join('public', 'apple-touch-icon.png'))
      click_button('Create Reward')
    }.to change(Reward, :count).by(1)

    expect(current_path).to eq(rewards_path)
    expect(page).to have_content('Test Reward')

  end

end