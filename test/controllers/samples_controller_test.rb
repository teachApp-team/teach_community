require 'test_helper'

class SamplesControllerTest < ActionDispatch::IntegrationTest
  test "should get hello" do
    get samples_hello_url
    assert_response :success
  end

end
