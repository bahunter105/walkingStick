class CompletedWalk < ApplicationRecord
  belongs_to :walk
  belongs_to :user
end
