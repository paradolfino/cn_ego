require 'rails_helper'

feature "admin/login" do
  scenario "it renders login form" do
    visit login_path
    expect(page).to have_xpath("//form")
  end

  scenario "it logins a user in and redirects to participants path" do
    user = User.create!(email: "Test@Testy.com", password: "123456")
    user.reload
    visit login_path
    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.password
    click_button "Log In"
    expect(page).to have_current_path(participants_path)
  end

end