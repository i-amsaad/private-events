class Event < ApplicationRecord
	belongs_to :creator, class_name: "User"
	has_many :event_attendings, foreign_key: :attended_event_id,
    dependent: :delete_all
    has_many :attendees, through: :event_attendings, source: :event_attendee,
    dependent: :delete_all
end
