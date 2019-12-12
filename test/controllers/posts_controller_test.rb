require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  test "index" do
    get :index, format: :json

    assert_response :success
  end

 test "create" do
    assert_difference "Post.count" do
      post :create, params:  { body: 'some body', title: "Title", user_id: users(:valid).id } 
    end

    assert_response :success
    json_response = JSON.parse(@response.body)
    assert_equal json_response["body"], "some body"
  end

  test "top_five_posts" do
    rank_one = posts(:rank_one)
    rank_two = posts(:rank_two)
    rank_three = posts(:rank_three)
    rank_four = posts(:rank_four)
    rank_five = posts(:rank_five)

    get :top_five_posts, format: :json
    json_response = JSON.parse(@response.body)
    assert_equal 5, json_response.size
    assert_equal rank_one.id, json_response[0]["id"] 
    assert_equal rank_two.id, json_response[1]["id"] 
    assert_equal rank_three.id, json_response[2]["id"] 
    assert_equal rank_four.id, json_response[3]["id"] 
    assert_equal rank_five.id, json_response[4]["id"]
    
  end
end
