require 'rails_helper'

feature "admin/login" do
  scenario "it renders login form" do
    visit login_path
    puts page.body
    expect(page).to have_xpath("//form")
  end

  scenario "it logins a user in and redirects to participants path" do
    user = create(:user)
    participant = create(:participant)
    visit login_path
    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.email
    click_button "Log In"
    field = page.find_by_id("points-#{participant.id}")[:id]
    expect(page).to have_content(participant.name)
  end

end