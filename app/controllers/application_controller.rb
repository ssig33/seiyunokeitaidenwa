class ApplicationController < ActionController::Base
  protect_from_forgery
  def login
    redirect_to '/' unless session[:login]
  end
end
