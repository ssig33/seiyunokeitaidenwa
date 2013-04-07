class IndexController < ApplicationController
  def index
    @list = Keitaidenwa.order('id desc')
  end

  def tweet
    login
    if request.xhr?
      render json: Tweet.from_url(params[:url])
    end
  end
end
