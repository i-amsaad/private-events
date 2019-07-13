class EventsController < ApplicationController
	def index
		@events=Event.all
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
	end
	def event_params
		params.require(:event).permit(:date,:description)
	end
end
