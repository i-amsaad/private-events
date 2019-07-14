class EventsController < ApplicationController
	def index
		@upcoming=Event.upcoming_events
		@previous=Event.previous_events
	end
	def new
		@event=Event.new
	end
	def create
		@user=User.find(session[:id])
		@event=@user.events.build(event_params)
		@event.save
		redirect_to(@user)
	end
	def show
		@event=Event.find(params[:id])
		@attendees=@event.attendees
	end
	def event_params
		params.require(:event).permit(:date,:description)
	end
end
