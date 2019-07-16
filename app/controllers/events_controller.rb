class EventsController < ApplicationController
	before_action :check_loggedin, only: [:new, :create]
	def index
		@upcoming_events=Event.upcoming_events
		@previous_events=Event.previous_events
	end
	def new
		@event=Event.new
	end
	def create
		@event=@current_user.events.new(event_params)
		if @event.save
			redirect_to(@current_user)
		else
			render :new
		end
	end
	def show
		@event=Event.find(params[:id])
		@attendees=@event.attendees
		@current_user_attending = !@current_user.blank? && @attendees.exists?(@current_user.id)
	end
	
	def event_params
		params.require(:event).permit(:date,:description)
	end

	def check_loggedin
		#This method checks opposite condition to the one checked in application controller's check_loggedin 
		if @current_user.blank?
			flash[:notice]="Please, Login to create an Event"
			redirect_to("/signin")
		end
	end
	def attending
		@current_user.event_attendings.create(attended_event_id: params[:event_id])
		redirect_to(@current_user)
	end
end