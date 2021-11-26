class AddLocationToWalks < ActiveRecord::Migration[6.0]
  def change
    add_column :walks, :location, :string
  end
end
