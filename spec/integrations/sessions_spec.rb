require 'rails_helper'

feature "admin/login" do
  scenario "it renders login form" do
    visit login_path
    puts page.inspect
    expect(page).to have_content("Admin Login")
  end

end