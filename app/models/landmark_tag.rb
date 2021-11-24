class LandmarkTag < ApplicationRecord
  belongs_to :tag
  belongs_to :landmark

  validates :tag, uniqueness: { scope: :landmark, message: "already added" }
end
