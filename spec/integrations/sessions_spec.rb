require 'rails_helper'

feature "admin/login" do
  scenario "it renders login form" do
    visit login_path
    puts page
    expect(page).to have_content("Log In")
  end

end