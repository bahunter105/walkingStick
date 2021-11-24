class LandmarksController < ApplicationController
  def show
    @landmark = Landmark.find(params[:id])
    @walk = Walk.find(params[:walk_id])
  end
end
