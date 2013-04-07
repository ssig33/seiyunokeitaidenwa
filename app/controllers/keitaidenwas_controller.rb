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

  def show
    @k = Keitaidenwa.find params[:id]
  end
end
