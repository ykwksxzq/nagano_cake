class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.cart_item_id = current_customer.id
    @order.save
    redirect_to orders_confirm_path
  end


  private

  def order_params
    params.require(:order).permit(:customer_id, :shipping_postal_code, :shipping_address, :shopping_name, :shopping_cost, :total_payment, :payment_method)
  end



end
