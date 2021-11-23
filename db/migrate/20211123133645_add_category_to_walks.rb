class AddCategoryToWalks < ActiveRecord::Migration[6.0]
  def change
    add_reference :walks, :category, null: false, foreign_key: true
  end
end
