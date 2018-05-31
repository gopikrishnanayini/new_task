require 'test_helper'

class ApiControllerTest < ActionDispatch::IntegrationTest
  test "should get authors" do
    get api_authors_url
    assert_response :success
  end

end
