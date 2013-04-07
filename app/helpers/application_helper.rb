module ApplicationHelper
  def login?
    !session[:login].blank?
  end
end
