require "test_helper"

class ProblemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @problem = create(:problem)
  end

  test "should get index" do
    get problems_url, as: :json
    assert_response :success
  end

  test "should create problem" do
    new_problem = attributes_for(:problem)

    assert_difference("Problem.count") do
      post problems_url, params: { problem: new_problem }, as: :json
    end

    assert_response :created
  end

  test "should show problem" do
    get problem_url(@problem), as: :json
    assert_response :success
  end

  test "should update problem" do
    atcoder_id = Faker::Lorem.unique.characters(number: 10)
    title = Faker::Lorem.words(number: 3).join(" ").capitalize
    author = Faker::Name.unique.name
    url = Faker::Internet.unique.url
    rating = Faker::Number.between(from: 0, to: 4000)
    tried = Faker::Number.between(from: @problem.tried, to: 4000)
    solved = Faker::Number.between(from: 0, to: tried)
    description = Faker::Lorem.unique.paragraph
    sample_test = [ "0_0_3", "0_0_4" ]
    tags = [ "dp", "fft", "ntt" ]
    hints = [ "hint_3", "hint_4" ]
    tutorial_code = Faker::Lorem.unique.paragraph

    patch problem_url(@problem), params: {
      problem: {
        atcoder_id: atcoder_id,
        title: title,
        author: author,
        url: url,
        rating: rating,
        tried: tried,
        solved: solved,
        description: description,
        sample_test: sample_test,
        tags: tags,
        hints: hints,
        tutorial_code: tutorial_code
      }
    }, as: :json

    assert_response :success

    @problem.reload

    assert_equal atcoder_id, @problem.atcoder_id
    assert_equal title, @problem.title
    assert_equal author, @problem.author
    assert_equal url, @problem.url
    assert_equal rating, @problem.rating
    assert_equal tried, @problem.tried
    assert_equal solved, @problem.solved
    assert_equal description, @problem.description
    assert_equal sample_test, @problem.sample_test
    assert_equal tags, @problem.tags
    assert_equal hints, @problem.hints
    assert_equal tutorial_code, @problem.tutorial_code
  end

  test "should destroy problem" do
    assert_difference("Problem.count", -1) do
      delete problem_url(@problem), as: :json
    end

    assert_response :no_content
  end
end
