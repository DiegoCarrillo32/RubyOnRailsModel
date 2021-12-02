class OrderItemsController < ApplicationController

  def index
    @order_items = OrderItem.all
  end

  def create
    @order_item = OrderItem.new(order_items_params)
    @order_item.save

  end

  def show
    @order_item = OrderItem.find(params[:id])
  end

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_items_params)
  end

  def destroy
    @order_item = OrderItem.find(params[:id])
    @order_item.destroy
  end


  protected

  def order_items_params
    params.require(:order_item).permit(:quantity)
  end


end
