class AddDistanceToWalks < ActiveRecord::Migration[6.0]
  def change
    add_column :walks, :distance, :integer
  end
end
