class OrdersController < ApplicationController

  def index
    @orders = Order.all.paginate :page => params[:page]
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
      render :action => :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to(orders_url)

  end

end
