class UsersController < ApplicationController
  def show
      def show
    @user = User.find(params[:id])
    @walks = Walk.all
    @random_walks = @walks.sample(2)
  end

  end
end
