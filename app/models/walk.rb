require 'open-uri'
require 'json'

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

  def calc_distance
    base_url= "https://api.mapbox.com/directions/v5/mapbox/walking/"
    index = 0
    25.times do
      index += 1
      unless self.walk_landmarks.find_by(landmark_order_no: index).nil?
        target_lm = self.walk_landmarks.find_by(landmark_order_no: index).landmark
        base_url += "#{target_lm.longitude},#{target_lm.latitude};"
      end
    end
    api_setting_url = "?alternatives=false&continue_straight=true&geometries=geojson&overview=simplified&steps=false&access_token="
    mapbox_key = ENV['MAPBOX_API_KEY']
    map_api_url = base_url.chomp(';') + api_setting_url + mapbox_key
    dist_hash = URI.open(map_api_url)
    parsd = JSON.parse(dist_hash.string)
    routes = parsd["routes"]
    routes_1 = routes[0]
    distance = routes_1["distance"]
    # self.distance = distance
    # self.save
    return distance
  end

  def distance_to_km
    self.distance.to_f / 1000
  end

  def blank_stars
    5 - rating.to_i
  end
end
