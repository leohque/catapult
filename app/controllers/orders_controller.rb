class OrdersController < ApplicationController

  def index
    @orders = Order.where(user: current_user)
  end

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.new(user: current_user.id, status: "pending")

    redirect_to @order_id
  end

end
