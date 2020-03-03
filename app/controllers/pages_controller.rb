class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @users = User.geocoded
    @artists = []
    @artists = @users.select do |user|
      user.arts.present?
    end
    @markers = @artists.map do |user|
      if user.photo.attached?
        user_avatar = Cloudinary::Utils.cloudinary_url(user.photo.key, {})
      else
        user_avatar = 'catprofile.jpeg'
      end
       {
        lat: user.latitude + rand(-0.02..0.02),
        lng: user.longitude + rand(-0.02..0.02),
        infoWindow: render_to_string(partial: "users/info_window", locals: { user: user }),
        image_url: helpers.asset_url(user_avatar)
      }
    end
  end

end
