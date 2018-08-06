require 'rails_helper'

feature "participants/index" do

  let(:participant) {create(:participant)}

  scenario "renders a list of participants" do
    create(:second_participant)
    visit participants_path

    expect(page).to_not have_content('testsadasd')
    expect(page).to have_content("test2")
  end
  scenario "renders a list of participants and allows for inc points" do

    visit participants_path
    fill_in 'points', with: 1000
    click_button('+')
    expect(participant.points).to eq(1100)
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