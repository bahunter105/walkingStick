class Landmark < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, primary_key: :id, class_name: "User"
  has_many :landmark_tags, dependent: :destroy
  has_many :tags, through: :landmark_tags
  has_many :walk_landmarks
  has_many :walks, through: :walk_landmarks
  has_many :completed_landmarks, dependent: :destroy
  has_many :users, through: :completed_landmarks
  has_many :ratings
  has_many :users, through: :ratings
  has_one_attached :photo
  has_one_attached :audio
  has_one_attached :prearrival_audio
  validates :title, presence: true
end
