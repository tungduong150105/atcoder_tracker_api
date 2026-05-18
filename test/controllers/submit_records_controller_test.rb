require "test_helper"

class SubmitRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @submit_record = submit_records(:one)
  end

  test "should get index" do
    get submit_records_url, as: :json
    assert_response :success
  end

  test "should create submit_record" do
    assert_difference("SubmitRecord.count") do
      post submit_records_url, params: { submit_record: { execution_time: @submit_record.execution_time, memory_used: @submit_record.memory_used, problem_id: @submit_record.problem_id, status: @submit_record.status, submission_id: @submit_record.submission_id, submitted_at: @submit_record.submitted_at, user_id: @submit_record.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show submit_record" do
    get submit_record_url(@submit_record), as: :json
    assert_response :success
  end

  test "should update submit_record" do
    patch submit_record_url(@submit_record), params: { submit_record: { execution_time: @submit_record.execution_time, memory_used: @submit_record.memory_used, problem_id: @submit_record.problem_id, status: @submit_record.status, submission_id: @submit_record.submission_id, submitted_at: @submit_record.submitted_at, user_id: @submit_record.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy submit_record" do
    assert_difference("SubmitRecord.count", -1) do
      delete submit_record_url(@submit_record), as: :json
    end

    assert_response :no_content
  end
end
