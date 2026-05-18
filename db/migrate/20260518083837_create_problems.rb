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
      t.string :sample_test, array: true, default: []
      t.string :tags, array: true, default: []
      t.string :hints, array: true, default: []
      t.text :tutorial_code

      t.timestamps
    end
  end
end
