class ArtsController < ApplicationController
  private

  def art_params
    params.require(:art).permit(photos: [])
  end
end
