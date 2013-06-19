class SeiyuController < ApplicationController
  def show
    @s = Seiyu.where(name: params[:name]).first
  end

  def delete
    raise unless session[:login] == "twitter+5159931"
    @s = Seiyu.where(name: params[:name]).first.destroy
    redirect_to '/'
  end

  def edit
    @s = Seiyu.where(name: params[:name]).first
  end

  def update
    s = Seiyu.where(name: params[:name]).first
    s.update_attributes params[:seiyu].permit([:name, :url])
    redirect_to seiyu_path s
  end

  def ranking
    @list = Keitaidenwa.joins(:seiyu).group("seiyus.name").select('seiyus.name as name, count(distinct phone) as count').order('count desc').limit(20)
  end
end
