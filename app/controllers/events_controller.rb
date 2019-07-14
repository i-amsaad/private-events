class EventsController < ApplicationController
	before_action :check_loginned, only: [:new, :create]
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
		@current_user_attendent=false
		if session[:id]!=nil
			@current_user_attendent=@attendees.exists?(session[:id])
		end

	end
	
	def event_params
		params.require(:event).permit(:date,:description)
	end

	def check_loginned
		if session[:id]==nil
			flash[:notice]="Please, Login to create an Event"
			redirect_to("/signin")
		end
	end
end
