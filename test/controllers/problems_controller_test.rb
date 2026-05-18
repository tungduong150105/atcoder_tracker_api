require "test_helper"

class ProblemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @problem = problems(:one)
  end

  test "should get index" do
    get problems_url, as: :json
    assert_response :success
  end

  test "should create problem" do
    assert_difference("Problem.count") do
      post problems_url, params: { problem: { atcoder_id: @problem.atcoder_id, author: @problem.author, description: @problem.description, hints: @problem.hints, rating: @problem.rating, sample_test: @problem.sample_test, solved: @problem.solved, tags: @problem.tags, title: @problem.title, tried: @problem.tried, tutorial_code: @problem.tutorial_code, url: @problem.url } }, as: :json
    end

    assert_response :created
  end

  test "should show problem" do
    get problem_url(@problem), as: :json
    assert_response :success
  end

  test "should update problem" do
    patch problem_url(@problem), params: { problem: { atcoder_id: @problem.atcoder_id, author: @problem.author, description: @problem.description, hints: @problem.hints, rating: @problem.rating, sample_test: @problem.sample_test, solved: @problem.solved, tags: @problem.tags, title: @problem.title, tried: @problem.tried, tutorial_code: @problem.tutorial_code, url: @problem.url } }, as: :json
    assert_response :success
  end

  test "should destroy problem" do
    assert_difference("Problem.count", -1) do
      delete problem_url(@problem), as: :json
    end

    assert_response :no_content
  end
end
