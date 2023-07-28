require "rails_helper"

RSpec.feature "CreatesValidEvents", type: :feature do
  before :each do
    User.create(email: "fede@sapu.com", password: "123456")
    visit new_user_session_path
    fill_in "Email", with: "fede@sapu.com"
    fill_in "Password", with: "123456"
    click_button "Log in"
  end

  it "creates a new event successfully" do
    visit new_event_path
    fill_in "Title", with: "Birthday Party"
    fill_in "Description", with: "Fun birthday celebration."
    fill_in "Date", with: "2023-08-01"
    fill_in "Location", with: "123 Milie Street, Ibiza"
    click_button "Create Event"

    expect(page).to have_current_path(event_path(Event.last))
    expect(page).to have_content("Event was successfully created.")
    expect(page).to have_content("Birthday Party")
    expect(page).to have_content("Fun birthday celebration.")
    expect(page).to have_content("2023-08-01")
    expect(page).to have_content("123 Milie Street, Ibiza")
  end
end
