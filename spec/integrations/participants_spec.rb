require 'rails_helper'

feature "participants/index" do
  scenario "renders a list of participants" do
    create(:participant)
    create(:second_participant)

    visit participants_path

    expect(page).to_not have_content('testsadasd')
    expect(page).to have_content("test2")
  end
end

feature 'New Participant' do
  scenario 'user adds a new Participant' do
    user = create(:user)
    visit participants_path

    expect{
      click_link 'New'
      fill_in 'name', with: 'Test Participant'
      fill_in 'points', with: 10
      click_button('Create Participant')
    }.to change(Participant, :count).by(1)

    expect(current_path).to eq(participants_path)
    expect(page).to have_content('Test Participant')

  end
end