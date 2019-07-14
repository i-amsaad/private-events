class User < ApplicationRecord
	require 'date'
	has_many :events, foreign_key: :creator_id, class_name: "Event",
    dependent: :delete_all
    has_many :event_attendings, foreign_key: :event_attendee_id,
    dependent: :delete_all
    has_many :attended_events, through: :event_attendings,
    dependent: :delete_all

    scope :previous_events, -> { where("#{user.attended_events.date} < ?" , Date.current) }
    scope :upcoming_events, -> { where("#{user.attended_events.date} >= ?" , Date.current) }
end
