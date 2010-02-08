class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(params[:order])
    if @order.save
      flash[:notice] = "預約成功"
      redirect_to order_url(@order)
    else
    end
  end

  def show
    @order = Order.find(params[:id])
  end

end
