class CreateCompletedLandmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :completed_landmarks do |t|
      t.references :landmark, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
