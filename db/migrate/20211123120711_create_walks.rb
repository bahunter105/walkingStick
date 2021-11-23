class CreateWalks < ActiveRecord::Migration[6.0]
  def change
    create_table :walks do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true
      t.string :spotify_imbed_url
      t.integer :rating

      t.timestamps
    end
  end
end
