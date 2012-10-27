class TweetsController < ApplicationController
  def index
    
    if params[:username]
      @username = params[:username]
    else
      @username = 'dhh'
    end
    
    @tweets = cache_username(@username)
    
  end
  
  private
  
  def cache_username(username)
    Rails.cache.fetch(username, expires_in: 5.minutes ) do
      tweets = Twitter.user_timeline(username, count: 25)
    end
  end
end
