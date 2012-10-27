class TweetsController < ApplicationController
  def index
    
    if params[:username]
      @username = params[:username]
    else
      @username = 'dhh'
    end
    
    @tweets = Twitter.user_timeline(@username, count: 25)
    
  end
end
