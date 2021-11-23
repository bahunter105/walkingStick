class Walk < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, primary_key: :id, class_name: "User"
  belongs_to :category
  has_many :users, through: :completed_walks
  has_many :landmarks, through: :walk_landmarks
end
