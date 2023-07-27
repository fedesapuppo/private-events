require "rails_helper"

RSpec.describe "SignUps", type: :request do
  describe "POST /sign_ups" do
    it "creates a new user and redirects to the root path" do
      user_params = {
        user: {
          email: "fede@sapu.com",
          password: "123456",
          password_confirmation: "123456",
        },
      }

      expect {
        post user_registration_path, params: user_params
      }.to change(User, :count).by(1)

      expect(response).to redirect_to(root_path)
      expect(response).to have_http_status (303)
      expect(flash[:notice]).to eq("Welcome! You have signed up successfully.")
    end
  end
end
