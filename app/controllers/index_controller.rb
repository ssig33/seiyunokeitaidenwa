class IndexController < ApplicationController
  def index
    @list = Keitaidenwa.order('id desc')
    @html = params[:no_cache] ? html : Rails.cache.fetch("index_html_#{params[:page]}", expire_in: 2.minute){ html}
  end

  def tweet
    login
    if request.xhr?
      render json: Tweet.from_url(params[:url])
    end
  end

  private
  def html
    render_to_string layout: false, template: 'index/_list', locals: {page: params[:page]}
  end
end
