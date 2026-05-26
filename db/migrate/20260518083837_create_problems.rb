class CreateProblems < ActiveRecord::Migration[8.1]
  def change
    create_table :problems do |t|
      t.string :atcoder_id
      t.string :title
      t.string :author
      t.string :url
      t.integer :rating
      t.integer :solved
      t.integer :tried
      t.text :description
      t.jsonb :sample_test, default: []
      t.jsonb :tags, default: []
      t.jsonb :hints, default: []
      t.text :tutorial_code

      t.timestamps
    end
  end
end
