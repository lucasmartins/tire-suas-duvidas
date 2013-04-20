class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    @current_user ||= User.find_by(:id=>session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def index
    if current_user==nil
      redirect_to '/auth/github'
      return
    end
    render :text=>"Logged as #{current_user.email}"
  end
end
