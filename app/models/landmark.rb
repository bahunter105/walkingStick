class Landmark < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, primary_key: :id, class_name: "User"
  has_many :landmark_tags, dependent: :destroy
  has_many :tags, through: :landmark_tags
  has_many :walks, through: :walk_landmarks
  has_many :users, through: :ratings
  has_many :ratings
  has_one_attached :photo

  validates :title, presence: true
end
