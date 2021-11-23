class WalksController < ApplicationController
  def index
    @walks = Walk.all
  end

  def show
    @walk = Walk.find(params[:id])
    @landmarks = @walk.landmarks
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
