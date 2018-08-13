require 'rails_helper'

feature "admin/login" do
  scenario "it renders login form" do
    visit login_path
    expect(page).to have_xpath("//form")
  end

  scenario "it logins a user in and redirects to participants path" do
    user = create(:user)

    visit login_path
    fill_in "session_email", with: user.email
    fill_in "session_password", with: user.email
    click_button "Log In"
    puts page.body
    expect(page).to be_participants_page
  end

end