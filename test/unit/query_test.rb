require 'test_helper'

class QueryTest < ActiveSupport::TestCase
  test "Query stores a username" do
    q = Query.new(username: "darthvader")
    assert q.username == "darthvader"
  end
  
  test "Query stores a response as a child tweets" do
    
    username = 'darthvader'
    response = Twitter.user_timeline(username, count: 25)
    
    q = Query.create( username: username, response: response )
    
    assert q.username == username, "username not equal"
    assert q.tweets.count > 0, "no tweets created"
    assert_kind_of Tweet, q.tweets.first, "first element is not a Tweet"
    
  end
end
