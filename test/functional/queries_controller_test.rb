require 'test_helper'

class QueriesControllerTest < ActionController::TestCase
  
  setup do
    Query.delete_all
  end
  
  
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show action" do
    q = Query.create
    get :show, id: q._id
    assert_response :success
  end

end
