class SeiyuController < ApplicationController
  def show
    @s = Seiyu.where(name: params[:name]).first
  end

  def delete
    @s = Seiyu.where(name: params[:name]).first.destroy
    redirect_to '/'
  end

  def edit
    @s = Seiyu.where(name: params[:name]).first
  end

  def update
    s = Seiyu.where(name: params[:name]).first
    s.update_attributes params[:seiyu]
    redirect_to seiyu_path s
  end
end
