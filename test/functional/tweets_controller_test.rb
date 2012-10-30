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
    assert_select "[value=?]", /dhh/
    assert_select "ol>li", 25
  end
  
  test "username form should load username's tweets" do
    post :index, :username => 'darthvader'
    assert_template 'index'
    assert_select "[value=?]", /darthvader/
    assert_select "ol>li", 25
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
  
  test "Invalid username is handled" do
    username = 'lsdfjguanr7dklsehasl2'
    get :index, :username => username
    
    assert_select "div.alert", :text => "Invalid username."
    assert_equal "Invalid username.", flash[:alert]
  end

end
