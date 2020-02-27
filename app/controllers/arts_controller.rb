class ArtsController < ApplicationController

  def index
    @arts = policy_scope(Art).order(created_at: :desc)
  end

  def show
    @art = Art.find(params[:id])

    authorize @art
  end

  def new
    @art = Art.new

    authorize @art
  end

  def create
    @art = Art.new(art_params)
    @art.user = current_user # code to connect the new art to the user
    authorize @art

    if @art.save
      redirect_to arts_path  #to root while we don't have a user_path
    else
      render :new
    end
  end

  def edit
    @art = Art.find(params[:id])

    authorize @art
  end

  def update
    @art = Art.find(params[:id])
    authorize @art
    @art.update(art_params)
    redirect_to art_path(@art)
  end

  def destroy
    @art = Art.find(params[:id])

    authorize @art

    @art.destroy

    redirect_to arts_path #to root while we don't have a user_path
  end

  private

  def art_params
    params.require(:art).permit(:name, :price, :description, :category, :quantity, photos: [])
  end
end
