require 'rails_helper'

feature "admin/login" do
  scenario "it renders login form" do
    visit login_path
    puts page.body
    sleep(3)
    expect(page).to have_xpath("//form")
  end

end