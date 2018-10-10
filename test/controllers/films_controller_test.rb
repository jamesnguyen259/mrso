require 'test_helper'

class FilmsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get films_new_url
    assert_response :success
  end

end
