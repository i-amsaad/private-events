class SessionsController < ApplicationController
	before_action :check_loginned, only: [:new, :create]
	def new
		@user=User.new
	end
	def create
		@c_user=User.find_by(username_params)
		if @c_user!=nil
			session[:id]=@c_user.id
			session[:username]=@c_user.username
			redirect_to(@c_user)
		else
			flash[:notice] = "User Not Found"
			redirect_to("/signin") #new_session_path
			#could be done as redirect_to new_session_path but to show sigin in in url it is done like this
		end
	end
	def username_params
		params.require(:user).permit(:username)
	end
	def destroy
		session[:id]=nil
		redirect_to ("/signin") #new_session_path
		#could be done as redirect_to new_session_path but to show sigin in in url it is done like this
	end
	def check_loginned
		if session[:id]!=nil
			@user=User.find(session[:id])
			redirect_to(@user)
		end
	end
end
