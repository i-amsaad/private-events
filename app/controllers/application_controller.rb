class ApplicationController < ActionController::Base
	before_action :set_user, except[:session_new,:session_create]

	def set_user
		@current_user=User.find(session[:id])
	end
end
