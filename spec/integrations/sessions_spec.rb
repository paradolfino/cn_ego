require 'rails_helper'

feature "admin/login" do
  scenario "it renders login form" do
    visit login_path
    puts page.body
    expect(page).to have_xpath("//form")
  end

  scenario "it logins a user in and redirects to participants path" do
    create(:user)
    visit login_path
    fill_in
  end

end