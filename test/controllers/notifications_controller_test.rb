require "test_helper"

class NotificationsControllerTest < ActionDispatch::IntegrationTest
  test "should store a new Notification" do
    post "/notifications",
      params: {
        notification: {
          store: "my store",
          model: "a shoe model",
          inventory: "0",
          notification_status: "No Stock",
        },
      }
    assert_response :success
  end

  test "should throw an exception if one param is missing when saving a new Notification" do
    post "/notifications",
      params: {
        notification: {
          store: "my store",
          model: "a shoe model",
          inventory: "0",
        },
      }
    assert_response :error
  end
end
