class CreateLandmarkTags < ActiveRecord::Migration[6.0]
  def change
    create_table :landmark_tags do |t|
      t.references :tag, null: false, foreign_key: true
      t.references :landmark, null: false, foreign_key: true

      t.timestamps
    end
  end
end
