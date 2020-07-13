require 'test_helper'

class EndPointsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get end_points_index_url
    assert_response :success
  end

end
