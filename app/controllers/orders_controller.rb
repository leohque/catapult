class OrdersController < ApplicationController

  def index
    # @orders = Order.where(user: current_user)
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(user: current_user.id, status: "pending")
    @art_order = ArtOrder.new
    @art_order.order = @order
    @art_order.art = y
    @order.art_order = @art_order
    redirect_to @order_id
  end

end
