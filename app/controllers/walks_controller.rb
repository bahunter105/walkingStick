class WalksController < ApplicationController
  def index
    @walks = Walk.all
  end

  def show
    @walk = Walk.find(params[:id])
    @landmarks = @walk.landmarks
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    # @markers = @landmarks.geocoded.map do |landmark|
    #   {
    #     lat: landmark.latitude,
    #     lng: landmark.longitude,
    #     info_window: render_to_string(partial: "map_info_window", locals: { landmark: landmark })
    #   }
    # end
    @markers = @landmarks.map do |landmark|
      {
        lat: landmark.latitude,
        lng: landmark.longitude,
        info_window: render_to_string(partial: "map_info_window", locals: { landmark: landmark })
      }
    end
  end

  def navigate
    @walk = Walk.find(params[:walk_id])
    @landmark = @walk.walk_landmarks.find_by(landmark_order_no: 1).landmark
  end

  def start_navigate
    @walk = Walk.find(params[:id])
    @landmark = @walk.landmarks.first
  end
end
