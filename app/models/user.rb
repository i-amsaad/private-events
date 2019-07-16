class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id, class_name: "Event",
  dependent: :delete_all
  has_many :event_attendings, foreign_key: :event_attendee_id,
  dependent: :delete_all
  has_many :attended_events, through: :event_attendings,
  dependent: :delete_all
  
  validates :username, uniqueness: true, presence: true
end
