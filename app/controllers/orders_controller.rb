class OrdersController < ApplicationController

  def index
    # @orders = Order.where(user: current_user)
    @orders = current_user.orders.order(created_at: :desc)
    # @orders = policy_scope(Order).order(created_at: :desc) -> this would give us the same result
  end

  def show
    @order = Order.find(params[:id])

    authorize @order
  end

  def new
    @order = Order.new
  end

  def create
    raise
    @art = 1
    if current_user.orders.where(status: 'open').any?
      @order = current_user.find_by(status: 'open')
      @art_order = ArtOrder.new(order: @order)
      @art_order.art = @art
      @art_order.price = @art.price
      @art_order.save
      redirect_to arts_path
    else
      @order = Order.new(user: current_user, status: "open")
      @art_order = ArtOrder.new

    end
# check if there is any open order
# if not, create a new order with the art
# else add the art ot the open order







    @art_order.order = @order
    @art_order.art = y
    @order.art_order = @art_order
    redirect_to @order_id
  end

  def update

  end

  def destroy

  end

end
