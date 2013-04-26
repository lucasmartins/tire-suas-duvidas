class SessionsController < ApplicationController
  def create
    Rails.logger.info "\n====================================\n"
    Rails.logger.info "\n#{env["omniauth.auth"]}\n"
    Rails.logger.info "\n====================================\n"
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    if session[:question_id]!=nil
      redirect_to question_path(session[:question_id])
    else
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  def login
    if current_user==nil
      redirect_to "/auth/#{params[:provider]}"
      return
    end
    redirect_to '/'
  end

end