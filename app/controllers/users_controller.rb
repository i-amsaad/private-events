class UsersController < ApplicationController
  before_action :check_loggedin, only: [:new, :create]
  def new
    @user=User.new
  end
  def create
    @user=User.new(user_params)
    if @user.save
      session[:id]=@user.id
      redirect_to(@user)
    else
      render :new
    end
  end
  def show
    @user=User.find(params[:id])
    @events=@user.events
    @upcoming_attendances=@user.attended_events.upcoming_events
    @previous_attendances=@user.attended_events.previous_events
  end
  def user_params
    params.require(:user).permit(:username)
  end
end
