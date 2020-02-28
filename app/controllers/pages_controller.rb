class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @users = User.geocoded
    @markers = @users.map do |user|
       {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "users/info_window", locals: { user: user }),
        image_url: helpers.asset_url('cat.png')
      }
    end
  end

  def profile
  end
end
