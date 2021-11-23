class Tag < ApplicationRecord
  has_many :landmark_tags, dependent: :destroy
  has_many :landmark, through: :landmark_tags
end
