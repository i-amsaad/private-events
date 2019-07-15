class EventsController < ApplicationController
	before_action :check_loggedin, only: [:new, :create]
	def index
		@upcoming=Event.upcoming_events
		@previous=Event.previous_events
	end
	def new
		@event=Event.new
	end
	def create
		@current_user.events.create(event_params)
		redirect_to(@current_user)
	end
	def show
		@event=Event.find(params[:id])
		@attendees=@event.attendees
		@current_user_attending = session[:id].present? && @attendees.exists?(session[:id])
	end
	
	def event_params
		params.require(:event).permit(:date,:description)
	end

	def check_loggedin
		if !@current_user.present?
			flash[:notice]="Please, Login to create an Event"
			redirect_to("/signin")
		end
	end
	def attending
		@event_attendee=@current_user.event_attendings.new(attended_event_id: params[:event_id])
		@event_attendee.save
		redirect_to(@current_user)
	end
end
