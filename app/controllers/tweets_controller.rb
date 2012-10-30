class TweetsController < ApplicationController
  
  before_filter :prime_queries_in_session
  
  DEFAULT_USERNAME = 'dhh'
  
  def index
    
    if params[:username]
      @username = params[:username]
    else
      @username = DEFAULT_USERNAME
    end
    
    begin
      @tweets = cache_username(@username)
    rescue Twitter::Error::NotFound
      @tweets = cache_username(DEFAULT_USERNAME)
      @username = DEFAULT_USERNAME
      flash[:alert] = "Invalid username."
    end
    
    @queries = session[:queries].uniq.reverse
  end
  
  private
  
  def cache_username(username)
    Rails.cache.fetch(username, expires_in: 5.minutes ) do
      tweets = Twitter.user_timeline(username, count: 25)
      if tweets && tweets.count > 0
        Query.create(username: username, response: tweets)
        session[:queries] << username
      end
      tweets
    end
  end
end
