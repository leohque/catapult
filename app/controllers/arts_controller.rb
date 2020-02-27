class ArtsController < ApplicationController

  def index
    @arts = policy_scope(Art)
  end

  def show
  end

   def new
    @art = Art.new

    authorize @art
  end

  def create
    @art = Art.new(art_params)
    authorize @art

    if @art.save
      redirect_to root_path #to root while we don't have a user_path
    else
      render :new
    end
  end

  def edit
    @art = Art.find(art_params)

    authorize @art
  end

  def update
    @art = Art.find(art_params)
    @art.update
  end

  def destroy
    @art = Art.find(params[:id])
    @art.destroy
    redirect_to root_path #to root while we don't have a user_path
  end

  private

  def art_params
    params.require(:art).permit(:name, :price, :description, :category, :quantity, photos: [])
  end
end
