class CreateLandmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :landmarks do |t|
      t.string :title
      t.float :latitude
      t.float :longitude
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
