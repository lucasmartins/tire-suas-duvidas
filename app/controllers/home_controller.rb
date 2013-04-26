class HomeController < ApplicationController
  def index
    @questions = Question.all
  end

  def login
    session[:question_id]=params[:question_id]
  end
end
