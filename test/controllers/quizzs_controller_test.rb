require "test_helper"

class QuizzsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get quizzs_show_url
    assert_response :success
  end

  test "should get index" do
    get quizzs_index_url
    assert_response :success
  end

  test "should get create" do
    get quizzs_create_url
    assert_response :success
  end

  test "should get new" do
    get quizzs_new_url
    assert_response :success
  end
end
