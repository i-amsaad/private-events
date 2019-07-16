class ApplicationController < ActionController::Base
  before_action :set_user
  def set_user
    @current_user = User.find_by(id: session[:id])
  end

  def check_loggedin
    if @current_user.present?
      redirect_to(@current_user, notice: "You are already logged in.")
    end
  end
end
