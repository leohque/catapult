class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @user = User.find(params[:user_id])

    authorize @user
  end
end
