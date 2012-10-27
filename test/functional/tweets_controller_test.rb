require 'test_helper'

class TweetsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tweets)
    assert_not_nil assigns(:username)
  end
  
  test "username form renders" do
    get :index
    assert_select("form") do
      assert_select("input#username")
      assert_select("input[type='submit']")
    end
  end
  
  test "slash username should load username's tweets" do
    get :index, :username => 'dhh'
    assert_select "h1", /dhh/
    assert_select "li", 25
  end
  
  test "username form should load username's tweets" do
    post :index, :username => 'ehayes'
    assert_template 'index'
    assert_select "h1", /ehayes/
  end
  
  test "API calls are cached" do
    ActionController::Base.perform_caching = true
    
    username = 'darthvader'
    Rails.cache.delete(username)
    assert_nil Rails.cache.fetch(username)
    get :index, :username => username
    assert_not_nil Rails.cache.fetch(username)
    
    ActionController::Base.perform_caching = false
  end

end
