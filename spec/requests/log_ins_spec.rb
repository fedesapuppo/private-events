require "rails_helper"

RSpec.describe "the login process", type: :feature do
  before :each do
    User.create(email: "fede@sapu.com", password: "123456")
  end

  it "logs me in" do
    visit new_user_session_path
    fill_in "Email", with: "fede@sapu.com"
    fill_in "Password", with: "123456"
    click_button "Log in"
    expect(page).to have_current_path(root_path)
    expect(page).to have_content("Signed in successfully.")
    expect(page.status_code).to eq(200)
  end
end
