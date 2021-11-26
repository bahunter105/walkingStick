class Walk < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, primary_key: :id, class_name: "User"
  belongs_to :category
  has_many :completed_walks
  has_many :users, through: :completed_walks
  has_many :walk_landmarks
  has_many :landmarks, through: :walk_landmarks
  has_one_attached :photo

  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :title, :location ],
    associated_against: {
      category: [ :name ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
