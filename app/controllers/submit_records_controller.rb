class SubmitRecordsController < ApplicationController
  before_action :set_submit_record, only: %i[ show update destroy ]

  # GET /submit_records
  def index
    @submit_records = SubmitRecord.all

    render json: @submit_records
  end

  # GET /submit_records/1
  def show
    render json: @submit_record
  end

  # POST /submit_records
  def create
    @submit_record = SubmitRecord.new(submit_record_params)

    if @submit_record.save
      render json: @submit_record, status: :created, location: @submit_record
    else
      render json: @submit_record.errors, status: :unprocessable_content
    end
  end

  # PATCH/PUT /submit_records/1
  def update
    if @submit_record.update(submit_record_params)
      render json: @submit_record
    else
      render json: @submit_record.errors, status: :unprocessable_content
    end
  end

  # DELETE /submit_records/1
  def destroy
    @submit_record.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_submit_record
      @submit_record = SubmitRecord.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def submit_record_params
      params.expect(submit_record: [ :user_id, :problem_id, :status, :submission_id, :execution_time, :memory_used, :submitted_at ])
    end
end
