class CreateCompletedWalks < ActiveRecord::Migration[6.0]
  def change
    create_table :completed_walks do |t|
      t.references :walk, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
