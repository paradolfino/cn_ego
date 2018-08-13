require 'rails_helper'

feature "admin/login" do
  scenario "it renders login form" do
    visit login_path
    puts page.body
    sleep(3)
    expect(page).to have_content("Admin Login")
  end

end