class ChangeEventAttendingsFkNames < ActiveRecord::Migration[6.0]
  def change
  	change_table :event_attendings do |t|
  		t.rename :user_id, :event_attendee_id
  		t.rename :event_id, :attended_event_id
	end
  end
end
