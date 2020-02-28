class ArtOrdersController < ApplicationController
  def destroy
    @art_order = ArtOrder.find(params[:id])
    authorize @art_order
    @art_order.destroy

    redirect_to orders_path
  end
end
