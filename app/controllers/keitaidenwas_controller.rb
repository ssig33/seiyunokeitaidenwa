class KeitaidenwasController < ApplicationController
  def create
    login
    ActiveRecord::Base.transaction do
      p = params.dup.symbolize_keys
      s = Seiyu.find_or_create_by_name!(p[:keitaidenwa][:seiyu][:name])
      p[:keitaidenwa].delete :seiyu
      k = Keitaidenwa.create p[:keitaidenwa].merge(seiyu_id: s.id)
      redirect_to keitaidenwa_path(k.id)
    end
  rescue => e
    flash[:error] = e.message
    redirect_to '/'
  end

  def delete
    raise unless session[:login] == "twitter+5159931"
    Keitaidenwa.find(params[:id]).destroy
    redirect_to '/'
  end

  def list
    @list = Keitaidenwa.where(phone: params[:phone]).order('at desc')
  end

  def show
    @k = Keitaidenwa.find params[:id]
  end

  def edit
    login
    @k = Keitaidenwa.find params[:id]
  end
  
  def update
    login
    k = Keitaidenwa.find params[:id]
    k.update_attributes params[:keitaidenwa].permit([:phone, :at, :url, :description])
    redirect_to keitaidenwa_path k
  end

  def ranking
    @list = Keitaidenwa.group('phone').select('phone as phone, count(distinct seiyu_id) as count').order('count desc').limit(21) 
  end
end
