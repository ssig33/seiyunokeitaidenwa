class IndexController < ApplicationController
  def index
    unless html = Cache.get(request.url)
      @list = Keitaidenwa.order('id desc')
      html = render_to_string
      Cache.set request.url, html
    end
    render text: html
  end

  def tweet
    login
    if request.xhr?
      render json: Tweet.from_url(params[:url])
    end
  end
end
