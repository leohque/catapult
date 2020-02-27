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
    @order = current_user.orders.find_by(status: 'open')
    @order ||= Order.new(user: current_user, status: "open")

    authorize @order

    @order.save unless @order.persisted?

    @art = Art.find(params[:art_id])

    ArtOrder.create(order: @order, art: @art, price: @art.price)
  end

  def update

  end

  def destroy

  end

end
