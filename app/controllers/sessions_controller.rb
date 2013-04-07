class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    session[:login] = "#{auth['provider']}+#{auth['uid']}"
    redirect_to '/'
  end

  def destroy
    session.delete :login
    redirect_to '/'
  end
end
