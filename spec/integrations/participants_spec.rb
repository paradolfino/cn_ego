require 'rails_helper'

feature "participants/index" do

  scenario "renders a list of participants" do
    create(:participant)
    create(:second_participant)
    visit participants_path

    expect(page).to_not have_content('testsadasd')
    expect(page).to have_content("test2")
  end
  scenario "renders a list of participants and allows for inc points" do
    participant = create(:participant)
    visit participants_path
    field = page.find_by_id("points-#{participant.id}")[:id]
    btn = page.find_by_id("inc-#{participant.id}")[:id]
    expect {
      fill_in field, with: "10"
      click_button(btn)
    }.to change(participant, :points)
  end
end

feature 'New Participant' do
  scenario 'user adds a new Participant' do
    visit participants_path

    expect{
      click_link 'New'
      fill_in 'participant_name', with: 'Test Participant'
      fill_in 'participant_points', with: 10
      click_button('Create Participant')
    }.to change(Participant, :count).by(1)

    expect(current_path).to eq(participants_path)
    expect(page).to have_content('Test Participant')

  end
end

feature 'Edit Participant' do
  scenario 'user edits an existing Participant' do
    participant = create(:participant)
    visit edit_participant_path(participant.id)


    fill_in 'participant_name', with: 'Test Participant2'
    fill_in 'participant_points', with: 12
    click_button('Update Participant')

    expect(current_path).to eq(participants_path)
    expect(page).to have_content('Test Participant2')

  end
end