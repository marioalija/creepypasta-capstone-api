require "test_helper"

class StoriesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/stories.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Story.count, data.length
  end

  test "create" do
    assert_difference "Story.count", 1 do
      post "/stories.json", params: { name: "lake", width: 800, height: 600 }
      assert_response 200
    end
  end

  test "show" do
    get "/stories/#{Story.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user_id", "name", "image", "description", "category"], data.keys
  end

  test "update" do
    story = Story.first
    patch "/stories/#{story.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end

  test "destroy" do
    assert_difference "Story.count", -1 do
      delete "/stories/#{Story.first.id}.json"
      assert_response 200
    end
  end
end
