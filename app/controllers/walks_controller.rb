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
        info_window: render_to_string(partial: "info_window", locals: { landmark: landmark })
      }
    end

    # base_url= "https://api.mapbox.com/directions/v5/mapbox/walking/"
    # index = 0
    # 25.times do
    #   index += 1
    #   target_lm = @walk.walk_landmarks.find_by(landmark_order_no: index)
    #   unless target_lm.nil?
    #     base_url += "#{target_lm.longitude},#{target_lm.latitude};"
    #   end
    # end
    # api_setting_url = "?alternatives=false&continue_straight=true&geometries=geojson&overview=simplified&steps=false&access_token="
    # mapbox_key = ENV['MAPBOX_API_KEY']
    # map_api_url = base_url + api_setting_url + mapbox_key
  end

  def navigate
    @walk = Walk.find(params[:walk_id])
    @landmark = @walk.walk_landmarks.find_by(landmark_order_no: params[:landmark_order_no]).landmark

     @markers = [
       {
         lat: @landmark.latitude,
         lng: @landmark.longitude,
         info_window: render_to_string(partial: "info_window", locals: { landmark: @landmark })
       }
     ]
    # base_url= "https://api.mapbox.com/directions/v5/mapbox/walking/"
    # current_location = [-3.0000, 40.000]
    # base_url += "#{current_location[0]}%#{current_location[1]};#{@landmark.longitude}%#{@landmark.latitude}"
    # api_setting_url = "?alternatives=false&continue_straight=true&geometries=geojson&overview=simplified&steps=false&access_token="
    # mapbox_key = ENV['MAPBOX_API_KEY']
    # @map_api_url = base_url + api_setting_url + mapbox_key

  end

  def start_navigate
    @walk = Walk.find(params[:id])
    @landmark = @walk.landmarks.first
  end
end
