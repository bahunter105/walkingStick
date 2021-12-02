class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @user = current_user
    # @walk = current_user.completed_walks.last.walk
    @walks = Walk.all
  end
end
