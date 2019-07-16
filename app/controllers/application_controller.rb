class ApplicationController < ActionController::Base
  before_action :set_user
  def set_user
    @current_user = User.find_by(id: session[:id])
  end

  def check_loggedin
    if !@current_user.blank?
      flash[:notice]="You are already logged in."
      redirect_to(User.find(session[:id]))
    end
  end
end
