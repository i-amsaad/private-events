class SessionsController < ApplicationController
	before_action :check_loginned, only: [:new, :create]
	def new
		@user=User.new
	end
	def create
		puts params[:username]
		@c_user=User.find_by(username: params[:user][:username])
		#@c_user=User.find_by username: "#{params[:username].to_s.downcase}"
		puts @c_user
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
