class Public::OrdersController < ApplicationController
  def new
    @order = Order.all

  end

  def index
    @cart_item = CartItem.all
    @order = Order.all

  end

  def show
       @order = Order.find(params[:id])
  end


  def comfirm
    @cart_item = current_customer.cart_items
    @order = Order.new(order_params)
    @order.shipping_fee = 800

     if params[:order][:select_address] == "1"
        @order.address = current_customer.address
        @order.name = current_customer.full_name

     elsif params[:order][:select_address] == "2"

       if Address.exists?(id: params[:order][:address_id])
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
     sum = 0
     @cart_item.each do |cart_item|
       sum += cart_item.subtotal
     end
     sum += @order.shipping_fee
     @order.total_amount = sum
  end

  def complate
  end

 def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart|
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart.item.id
      order_detail.amount = cart.amount
      order_detail.price = cart.item.with_tax_price
      order_detail.save
    current_customer.cart_items.destroy_all
    redirect_to public_order_complate_path

    end

 end
 def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to public_orders_path
 end

   private

  def order_params
      params.require(:order).permit(:name, :address, :postal_code, :total_amount, :payment_type, :shipping_fee)
  end
end