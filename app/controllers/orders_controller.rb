class OrdersController < ApplicationController


  def index
    @orders = Order.all
  end

  def create
    @order = Order.new(order_params)
    @order.save

  end

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)

  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy

  end


  protected

  def order_params
    params.require(:order).permit(:date, :active)
  end


end
