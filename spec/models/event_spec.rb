require "rails_helper"
require "shoulda/matchers"

RSpec.describe Event, type: :model do
  context "validations" do
    it { should validate_presence_of(:title).with_message("Title can't be blank") }
    it { should validate_length_of(:title).with_message("Title must be between 3 and 100 characters") }
    it { should validate_presence_of(:description).with_message("Description can't be blank") }
    it { should validate_length_of(:description).with_message("Description must be at least 10 characters long") }
    it { should validate_presence_of(:date).with_message("Date can't be blank") }
    it { should validate_presence_of(:location).with_message("Location can't be blank") }
  end
end
