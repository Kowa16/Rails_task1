require "test_helper"

class ScheduleControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get schedule_top_url
    assert_response :success
  end
end
