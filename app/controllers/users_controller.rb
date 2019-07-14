class UsersController < ApplicationController
	before_action :check_loginned, only: [:new, :create]
	def new
		@user=User.new
	end
	def create
		@user=User.new(user_params)
		if @user.save
			session[:id]=@user.id
			session[:username]=@user.username
			redirect_to(@user)
		else
			render action: new
		end
	end
	def show
		@user=User.find(params[:id])
		@events=@user.events
		@attendings=@user.attended_events
	end
	def user_params
		params.require(:user).permit(:username)
	end
	def check_loginned
		if session[:id]!=nil
			@user=User.find(session[:id])
			redirect_to(@user)
		end
	end
end
