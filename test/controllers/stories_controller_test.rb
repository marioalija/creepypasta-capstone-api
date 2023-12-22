require "test_helper"

class StoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: "Admin", email: "admin@example.com", password: "password", image: "image_url")
    post "/sessions.json", params: { email: "admin@example.com", password: "password" }
    data = JSON.parse(response.body)
    @jwt = data["jwt"]
  end

  test "index" do
    get "/stories.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Story.count, data.length
  end

  test "create" do
    assert_difference "Story.count", 1 do
      post "/stories.json", headers: { "Authorization" => "Bearer #{@jwt}" }, params: { name: "test", password: "password", image: "image_url", user_id: User.first.id }
      data = JSON.parse(response.body)
      assert_response 200
    end
  end

  test "show" do
    get "/stories/#{Story.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "user", "name", "image", "description", "category", "comments"], data.keys
  end

  test "update" do
    story = Story.first
    patch "/stories/#{story.id}.json", headers: { "Authorization" => "Bearer #{@jwt}" }, params: { name: "Updated name", image: "image", descritption: "descritption", category: "category", comments: "comments" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
    assert_equal stories.image, data["image"]
    assert_equal stories.description, data["description"]
    assert_equal stories.category, data["category"]
    assert_equal stories.comments, data["comments"]

    patch "/stories/#{stories.id}.json"
    assert_response 401
  end

  test "destroy" do
    assert_difference "Story.count", -1 do
      delete "/stories/#{Story.first.id}.json"
      assert_response 200
    end
  end
end
