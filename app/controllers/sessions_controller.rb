class SessionsController < ApplicationController
  before_action :check_loggedin, only: [:new, :create]
  def new
    @user=User.new
  end
  def create
    @c_user=User.find_by(username: params[:user][:username])
    if @c_user!=nil
      session[:id]=@c_user.id
      redirect_to(@c_user)
    else
      flash[:notice] = "User Not Found"
      redirect_to("/signin") #new_session_path
      #could be done as redirect_to new_session_path but to show sigin in in url it is done like this
    end
  end
  def destroy
    session[:id]=nil
    @current_user=nil
    redirect_to ("/signin") #new_session_path
    #could be done as redirect_to new_session_path but to show sigin in in url it is done like this
  end

end
