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