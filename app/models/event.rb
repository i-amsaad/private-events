class Event < ApplicationRecord
	require 'date'
	belongs_to :creator, class_name: "User"
	has_many :event_attendings, foreign_key: :attended_event_id,
    dependent: :delete_all
    has_many :attendees, through: :event_attendings, source: :event_attendee,
    dependent: :delete_all

    validates :date, :description, presence: true

    scope :previous_events, -> { where("#{:date} < ?" , Date.current) }
    scope :upcoming_events, -> { where("#{:date} >= ?" , Date.current) }
end
