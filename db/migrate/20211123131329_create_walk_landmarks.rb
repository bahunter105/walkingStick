class CreateWalkLandmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :walk_landmarks do |t|
      t.references :walk, null: false, foreign_key: true
      t.references :landmark, null: false, foreign_key: true
      t.integer :landmark_order_no

      t.timestamps
    end
  end
end
