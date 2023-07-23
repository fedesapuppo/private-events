class Event < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: "User"
  has_many :attendances, foreign_key: :attended_event_id
  has_many :attendees, through: :attendances, source: :attendee
  scope :past, -> { where("date < ?", Date.today) }
  scope :upcoming, -> { where("date >= ?", Date.today) }
  validates :title, presence: { message: "Title can't be blank" }, length: { minimum: 3, maximum: 100, message: "Title must be between 3 and 100 characters" }
  validates :description, presence: { message: "Description can't be blank" }, length: { minimum: 10, message: "Description must be at least 10 characters long" }
  validates :date, presence: { message: "Date can't be blank" }
  validates :location, presence: { message: "Location can't be blank" }
end
