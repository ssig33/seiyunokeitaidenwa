class IndexController < ApplicationController
  def index
    @list = Keitaidenwa.order('id desc')
  end
end
