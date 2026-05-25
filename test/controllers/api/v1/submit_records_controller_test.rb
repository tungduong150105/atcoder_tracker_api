require "test_helper"

module Api
  module V1
    class SubmitRecordsControllerTest < ActionDispatch::IntegrationTest
      setup do
        @user = create(:user)
        @problem = create(:problem)

        @submit_record = create(:submit_record, user: @user, problem: @problem)
      end

      test "should get index" do
        get api_v1_submit_records_url, as: :json
        assert_response :success
      end

      test "should create submit_record" do
        new_submit_record = attributes_for(:submit_record).merge(
          user_id: @user.id,
          problem_id: @problem.id
        )

        assert_difference("SubmitRecord.count") do
          post api_v1_submit_records_url, params: { submit_record: new_submit_record }, as: :json
        end

        assert_response :created
      end

      test "should show submit_record" do
        get api_v1_submit_record_url(@submit_record), as: :json
        assert_response :success
      end

      test "should update submit_record" do
        status = %w[AC WA TLE MLE RTE RE CE].sample
        execution_time = Faker::Number.between(from: 5, to: 1500)
        memory_used = Faker::Number.between(from: 1024, to: 262144)
        submitted_at = Faker::Time.backward(days: 30)

        patch api_v1_submit_record_url(@submit_record), params: {
          submit_record: {
            execution_time: execution_time,
            memory_used: memory_used,
            status: status,
            submitted_at: submitted_at
          }
        }, as: :json

        assert_response :success

        @submit_record.reload

        assert_equal status, @submit_record.status
        assert_equal execution_time, @submit_record.execution_time
        assert_equal memory_used, @submit_record.memory_used
        assert_equal submitted_at.to_i, @submit_record.submitted_at.to_i
      end

      test "should destroy submit_record" do
        assert_difference("SubmitRecord.count", -1) do
          delete api_v1_submit_record_url(@submit_record), as: :json
        end

        assert_response :no_content
      end
    end
  end
end
