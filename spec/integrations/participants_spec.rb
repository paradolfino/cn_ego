require 'rails_helper'

feature "tasks/index" do
  scenario "renders a list of tasks" do
    create(:homework)
    create(:email)

    visit tasks_path

    expect(page).to have_content('complete homework')
    expect(page).to have_content("reply to Zack's email")
  end
end