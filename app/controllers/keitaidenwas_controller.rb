class KeitaidenwasController < ApplicationController
  def create
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
    k.update_attributes params[:keitaidenwa]
    redirect_to keitaidenwa_path k
  end
end
