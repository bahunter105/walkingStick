class RenameUserIdToCreatorIdInLandmarks < ActiveRecord::Migration[6.0]
  def change
    rename_column :landmarks, :user_id, :creator_id
  end
end
