class LandmarksController < ApplicationController
  def show

    @landmark = Landmark.find(params[:id])
    @walk = Walk.find(params[:walk_id])
    find_walk_landmark = @walk.walk_landmarks.find_by(landmark: @landmark)
    find_current_order_no = find_walk_landmark.landmark_order_no
    @next_order_number = find_current_order_no.to_i + 1
  end
end
