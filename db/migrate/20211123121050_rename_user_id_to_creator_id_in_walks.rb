class RenameUserIdToCreatorIdInWalks < ActiveRecord::Migration[6.0]
  def change
    rename_column :walks, :user_id, :creator_id
  end
end
