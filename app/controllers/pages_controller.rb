class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @walk = current_user.completed_walks.last.walk
  end
end



class CompletedWalksController
  def create
    @walk = Walk.fin...
    @user = current_user
    CompletedWalk.create(user: @user, walk: @walk)
    redirect_to dashboard_path
  end
end
