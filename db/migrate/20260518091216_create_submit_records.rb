class CreateSubmitRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :submit_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :problem, null: false, foreign_key: true
      t.string :status
      t.string :submission_id
      t.integer :execution_time
      t.integer :memory_used
      t.datetime :submitted_at

      t.timestamps
    end
  end
end
