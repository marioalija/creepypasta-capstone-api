require "test_helper"

class StoriesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/stories.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Story.count, data.length
  end
end
