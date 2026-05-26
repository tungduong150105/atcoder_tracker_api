require "test_helper"

module Api
  module V1
    class SessionsControllerTest < ActionDispatch::IntegrationTest
      setup do
        @user = create(:user, password: "password123", password_confirmation: "password123")
      end

      test "should login and return a valid jwt token" do
        post api_v1_login_url, params: {
          session: {
            username: @user.username,
            password: "password123"
          }
        }

        assert_response :ok

        json_response = response.parsed_body
        assert_not_nil json_response["token"]
        assert_not_nil json_response["exp"]
        assert_not_nil json_response["token"]
        assert_equal @user.username, json_response["username"]
      end

      test "should fail login with invalid credentials" do
        post api_v1_login_url, params: {
          session: {
            username: @user.username,
            password: "wrong_password"
          }
        }

        assert_response :unauthorized

        json_response = response.parsed_body
        assert_equal "Invalid username or password", json_response["error"]
      end
    end
  end
end
