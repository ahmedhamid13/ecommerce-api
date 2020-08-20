require 'test_helper'

class HandleErrorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get handle_errors_index_url
    assert_response :success
  end

end
