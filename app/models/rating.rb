class Rating < ApplicationRecord
  belongs_to :landmark
  belongs_to :user
end
