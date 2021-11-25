class CompletedWalksController < ApplicationController
  def create
    @walk = Walk.find(params[:walk_id])
    @user = current_user
    CompletedWalk.create(user: @user, walk: @walk)
    redirect_to dashboard_path
  end
end
