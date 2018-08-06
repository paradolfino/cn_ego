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
      click_link 'New Task'
      fill_in 'Name', with: 'Learn Rspec'
      fill_in 'Priority', with: 1
      fill_in 'Due date', with: DateTime.now
      select(user.email, from: 'task_user_id')
      click_button('Create Task')
    }.to change(Task, :count).by(1)

    expect(current_path).to eq(task_path(Task.last.id))
    expect(page).to have_content('Learn Rspec')

  end
end