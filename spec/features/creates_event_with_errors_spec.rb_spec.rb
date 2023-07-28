require "rails_helper"

RSpec.feature "CreatesEventWithErrorsSpec.rbs", type: :feature do
  before :each do
    User.create(email: "fede@sapu.com", password: "123456")
    visit new_user_session_path
    fill_in "Email", with: "fede@sapu.com"
    fill_in "Password", with: "123456"
    click_button "Log in"
  end

  it "displays error messages when event creation fails" do
    visit new_event_path
    click_button "Create Event"

    expect(page).to have_current_path(events_path)
    expect(page).to have_content("prohibited this event from being saved")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Date can't be blank")
    expect(page).to have_content("Location can't be blank")
    expect(page.status_code).to eq(200)
  end
end
