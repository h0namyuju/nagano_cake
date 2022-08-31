class Public::OrdersController < ApplicationController
  def new
    @order = Order.all

  end

  def index
    @cart_item = CartItem.all

  end

  def show
  end


  def comfirm
    @cart_item = CartItem.all
    @order = Order.new(order_params)


     if params[:order][:select_address] == "1"
        @order.address = current_customer.address
        @order.name = current_customer.full_name

     elsif params[:order][:select_address] == "2"

       if Address.exists?(name: params[:order][:address_id])
        @address = Address.find(params[:order][:address_id])
        @order.postal_code = @address.postal_code
        @order.name = @address.name
        @order.address = @address.address
       end

     elsif params[:order][:select_address] == "3"
       address_new = current_customer.address.new(address_params)

         if address_new.save
         else
            render :new
         end
     end
  end

  def complate
  end

 def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save
    redirect_to   public_order_complate_path

 end

   private

  def order_params
      params.require(:order).permit(:name, :address, :postal_code, :total_amount, :order_status, :payment_type)
  end
end