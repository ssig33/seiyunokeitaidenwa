class SeiyuController < ApplicationController
  def show
    @s = Seiyu.where(name: params[:name]).first
  end
end
