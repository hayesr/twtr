class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def prime_queries_in_session
    session[:queries] ||= []
  end
end
