class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @cart_items = current_customer.cart_items.all
    @total = 0
    @order = Order.new(order_params)
    @orders = Order.all
    if params[:order][:select_address].to_i == 0
    @order.shipping_postal_code = current_customer.postal_code
    @order.shipping_address = current_customer.address
    @order.shipping_name = current_customer.last_name + current_customer.first_name
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to orders_confirm_path
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_postal_code, :shipping_address, :shipping_name, :shipping_cost, :total_payment, :payment_method)
  end


end
