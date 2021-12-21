class WalksController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:search].present?
      @walks = Walk.global_search(params[:search][:query])
    else
      @walks = Walk.all
    end
  end

  def show
    @walk = Walk.find(params[:id])
    @landmarks = []
    @walk.walk_landmarks.order(landmark_order_no: :asc).each do |walk_landmark|
      @landmarks << walk_landmark.landmark
    end

    # the `geocoded` scope filters only landmarks with coordinates (latitude & longitude)
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
  end

  def completed
    @walks = Walk.all
    @walk = Walk.find(params[:walk_id])
    @user = User.find(params[:user_id])

    CompletedWalk.create!(
      walk_id: @walk.id,
      user_id: @user.id
    )
  end

  def navigate
    @walk = Walk.find(params[:walk_id])
    @landmark_order_no = params[:landmark_order_no]
    @landmark = @walk.walk_landmarks.find_by(landmark_order_no: @landmark_order_no).landmark
    @markers = [
      {
        lat: @landmark.latitude,
        lng: @landmark.longitude,
        info_window: render_to_string(partial: "info_window", locals: { landmark: @landmark })
      }
    ]
  end

  def start_navigate
    @walk = Walk.find(params[:id])
    @landmark = @walk.landmarks.first
  end

end
