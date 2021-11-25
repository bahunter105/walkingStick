class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    @walk = current_user.completed_walks.last.walk
  end
end




