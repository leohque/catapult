class OrdersController < ApplicationController
  # skip_before_action :authenticate_user!, only: :cancel
  def index
    # @orders = Order.where(user: current_user)
    # @orders = current_user.orders.order(created_at: :desc)
    @orders = policy_scope(Order).order(created_at: :desc) # -> this would give us the same result
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

  def edit
    @order = Order.find(params[:id])
  end

  # def update
  #   @order = Order.find(params[:id])
  # end

  def destroy
    @order = Order.find(params[:id])
    authorize @order
    @order.destroy

    redirect_to orders_path
  end

  def cancel
    @order = Order.find(params[:id])
    authorize @order
    @order.status = "cancelled"
    @order.save

    redirect_to orders_path
  end

  def confirm
    @order = Order.find(params[:id])
    authorize @order
    @order.art_orders.each do |art_order|
      if art_order.art.quantity <= 0
        redirect_to :orders_path, notice: "#{art_order.name} has already been sold."
      else
        art_order.art.quantity -= 1
        @order.status = "confirmed"
        @order.save
        art_order.art.save
        redirect_to orders_path
      end
    end
  end
end

# <% if result == nil %>
#   <%= javascript_tag "alert('hello welcome')" %>
# <% end %>
# Or even simpler:

# <%= javascript_tag "alert('hello welcome')" unless result %>
