require "test_helper"

module Api
  module V1
    class UsersControllerTest < ActionDispatch::IntegrationTest
      setup do
        @user = create(:user)
      end

      test "should get index" do
        get api_v1_users_url, as: :json
        assert_response :success
      end

      test "should create user" do
        new_user = attributes_for(:user)

        assert_difference("User.count") do
          post api_v1_users_url, params: { user: new_user }, as: :json
        end

        assert_response :created
      end

      test "should show user" do
        get api_v1_user_url(@user), as: :json
        assert_response :success
      end

      test "should update user" do
        old_username = @user.username
        new_email = Faker::Internet.unique.email
        new_atcoder_handle = Faker::Internet.unique.username(specifier: 5..10)
        new_rating = Faker::Number.between(from: 0, to: 3000)

        patch api_v1_user_url(@user), params: {
          user: {
            username: "new_user_name",
            email: new_email,
            atcoder_handle: new_atcoder_handle,
            rating: new_rating
          }
        }, as: :json

        assert_response :success

        @user.reload

        assert_equal new_email, @user.email
        assert_equal new_atcoder_handle, @user.atcoder_handle

        assert_equal old_username, @user.username
      end

      test "should destroy user" do
        assert_difference("User.count", -1) do
          delete api_v1_user_url(@user), as: :json
        end

        assert_response :no_content
      end
    end
  end
end
