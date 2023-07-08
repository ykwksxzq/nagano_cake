class Admin::CustomersController < ApplicationController

 def index
   @customers = Customer.page(params[:page]).per(10)
 end

 def show
   @customer = current_customer
 end




  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :first_name_kana, :last_name_kana,:postal_code, :address, :telephone_number, :email )
  end

end
