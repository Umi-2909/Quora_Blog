require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get show" do
    user = users(:one)  # Lấy một bản ghi user từ fixtures (hoặc bạn có thể tạo bản ghi tùy chỉnh)
    get user_url(user)
    assert_response :success
  end

  # Thêm các bài kiểm tra cho các action khác ở đây
end
